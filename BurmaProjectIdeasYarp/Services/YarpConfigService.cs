using BurmaProjectIdeasYarp.Models;
using System.Text.Json;
using Yarp.ReverseProxy.Configuration;

namespace BurmaProjectIdeasYarp.Services
{
    public class YarpConfigService
    {
        private const string CustomConfigFile = "api-custom-routes.json";
        private readonly IConfiguration _configuration;
        private readonly string _contentRootPath;
        private readonly object _lockObject = new();
        private readonly List<YarpRoute> _routes = new();
        private readonly List<YarpCluster> _clusters = new();
        private readonly Dictionary<string, string> _routeFiles = new(StringComparer.OrdinalIgnoreCase);
        private readonly Dictionary<string, string> _clusterFiles = new(StringComparer.OrdinalIgnoreCase);

        private static readonly Dictionary<string, string> ApiConfigMap = new()
        {
            { "burma_calendar", "api-burma-calendar-routes.json" },
            { "burmese_recipes", "api-burmese-recipes-routes.json" },
            { "movie_ticket_online_booking_system", "api-movie-ticket-online-booking-system-routes.json" },
            { "snake", "api-snake-routes.json" },
            { "bird", "api-bird-routes.json" },
            { "burmese_agriculture", "api-burmese-agriculture-routes.json" },
            { "incompatible_food", "api-incompatible-food-routes.json" },
            { "missing_historical_records", "api-missing-historical-records-routes.json" },
            { "quotlets", "api-quotlets-routes.json" },
            { "bagan_map", "api-bagan-map-routes.json" },
            { "art_gallery", "api-art-gallery-routes.json" },
            { "dream_dictionary", "api-dream-dictionary-routes.json" },
            { "lat_htauk_bay_din", "api-lat-htauk-bay-din-routes.json" },
            { "myanmar_proverbs", "api-myanmar-proverbs-routes.json" },
            { "pick_a_pile", "api-pick-a-pile-routes.json" },
            { "phayar_sar", "api-phayar-sar-routes.json" },
            { "zodiac", "api-zodiac-routes.json" }
        };
        
        // Event to notify when config changes
        public event Action? OnConfigChanged;

        public YarpConfigService(IConfiguration configuration, IWebHostEnvironment environment)
        {
            _configuration = configuration;
            _contentRootPath = environment.ContentRootPath;
            Load();
        }

        public Task<List<YarpRoute>> GetRoutesAsync()
        {
            lock (_lockObject)
            {
                return Task.FromResult(_routes.Select(Clone).ToList());
            }
        }

        public Task UpsertRouteAsync(YarpRoute route)
        {
            lock (_lockObject)
            {
                var existing = _routes.FirstOrDefault(r => r.RouteId.Equals(route.RouteId, StringComparison.OrdinalIgnoreCase));
                if (existing is not null && route.Transforms.Count == 0)
                {
                    route.Transforms = existing.Transforms.Select(t => new Dictionary<string, string>(t)).ToList();
                }

                var fileName = existing is null
                    ? CustomConfigFile
                    : _routeFiles.GetValueOrDefault(existing.RouteId, CustomConfigFile);

                if (existing is not null)
                {
                    _routes.Remove(existing);
                }

                _routes.Add(Clone(route));
                _routeFiles[route.RouteId] = fileName;
                SaveFile(fileName);
            }

            OnConfigChanged?.Invoke();
            return Task.CompletedTask;
        }

        public Task DeleteRouteAsync(string routeId)
        {
            var changed = false;
            var fileName = CustomConfigFile;

            lock (_lockObject)
            {
                var route = _routes.FirstOrDefault(r => r.RouteId.Equals(routeId, StringComparison.OrdinalIgnoreCase));
                if (route is not null)
                {
                    fileName = _routeFiles.GetValueOrDefault(route.RouteId, CustomConfigFile);
                    _routes.Remove(route);
                    _routeFiles.Remove(route.RouteId);
                    SaveFile(fileName);
                    changed = true;
                }
            }

            if (changed)
            {
                OnConfigChanged?.Invoke();
            }

            return Task.CompletedTask;
        }

        public Task<List<YarpCluster>> GetClustersAsync()
        {
            lock (_lockObject)
            {
                return Task.FromResult(_clusters.Select(Clone).ToList());
            }
        }

        public Task UpsertClusterAsync(YarpCluster cluster)
        {
            lock (_lockObject)
            {
                var existing = _clusters.FirstOrDefault(c => c.ClusterId.Equals(cluster.ClusterId, StringComparison.OrdinalIgnoreCase));
                var fileName = existing is null
                    ? CustomConfigFile
                    : _clusterFiles.GetValueOrDefault(existing.ClusterId, CustomConfigFile);

                if (existing is not null)
                {
                    _clusters.Remove(existing);
                }

                _clusters.Add(Clone(cluster));
                _clusterFiles[cluster.ClusterId] = fileName;
                SaveFile(fileName);
            }

            OnConfigChanged?.Invoke();
            return Task.CompletedTask;
        }

        public Task DeleteClusterAsync(string clusterId)
        {
            var changed = false;
            var fileName = CustomConfigFile;

            lock (_lockObject)
            {
                var cluster = _clusters.FirstOrDefault(c => c.ClusterId.Equals(clusterId, StringComparison.OrdinalIgnoreCase));
                if (cluster is not null)
                {
                    fileName = _clusterFiles.GetValueOrDefault(cluster.ClusterId, CustomConfigFile);
                    _clusters.Remove(cluster);
                    _clusterFiles.Remove(cluster.ClusterId);
                    SaveFile(fileName);
                    changed = true;
                }
            }

            if (changed)
            {
                OnConfigChanged?.Invoke();
            }

            return Task.CompletedTask;
        }

        public (IReadOnlyList<RouteConfig> Routes, IReadOnlyList<ClusterConfig> Clusters) GetYarpConfig()
        {
            lock (_lockObject)
            {
                var routes = _routes.Select(r => new RouteConfig
                {
                    RouteId = r.RouteId,
                    ClusterId = r.ClusterId,
                    Match = new RouteMatch { Path = r.MatchPath },
                    Transforms = r.Transforms.Select(t => (IReadOnlyDictionary<string, string>)t).ToList()
                }).ToList();

                var clusters = _clusters.Select(c => new ClusterConfig
                {
                    ClusterId = c.ClusterId,
                    Destinations = c.Destinations.ToDictionary(
                        d => d.Key,
                        d => new DestinationConfig { Address = d.Value }
                    ),
                    LoadBalancingPolicy = c.LoadBalancingPolicy
                }).ToList();

                return (routes, clusters);
            }
        }

        private void Load()
        {
            _routes.Clear();
            _clusters.Clear();
            _routeFiles.Clear();
            _clusterFiles.Clear();

            foreach (var fileName in GetConfigFiles())
            {
                LoadFile(fileName);
            }
        }

        private IEnumerable<string> GetConfigFiles()
        {
            foreach (var child in _configuration.GetSection("EnabledApis").GetChildren())
            {
                if (child.Get<bool>() && ApiConfigMap.TryGetValue(child.Key, out var fileName))
                {
                    yield return fileName;
                }
            }

            if (File.Exists(GetPath(CustomConfigFile)))
            {
                yield return CustomConfigFile;
            }
        }

        private void LoadFile(string fileName)
        {
            var path = GetPath(fileName);
            if (!File.Exists(path)) return;

            using var document = JsonDocument.Parse(File.ReadAllText(path));
            if (!document.RootElement.TryGetProperty("ReverseProxy", out var reverseProxy)) return;

            if (reverseProxy.TryGetProperty("Routes", out var routes))
            {
                foreach (var routeElement in routes.EnumerateObject())
                {
                    var route = new YarpRoute
                    {
                        RouteId = routeElement.Name,
                        ClusterId = GetString(routeElement.Value, "ClusterId"),
                        MatchPath = routeElement.Value.TryGetProperty("Match", out var match) ? GetString(match, "Path") : string.Empty,
                        Enabled = !routeElement.Value.TryGetProperty("Enabled", out var enabled) || enabled.GetBoolean()
                    };

                    if (routeElement.Value.TryGetProperty("Transforms", out var transforms))
                    {
                        foreach (var transform in transforms.EnumerateArray())
                        {
                            route.Transforms.Add(transform.EnumerateObject()
                                .ToDictionary(p => p.Name, p => p.Value.GetString() ?? string.Empty));
                        }
                    }

                    _routes.RemoveAll(r => r.RouteId.Equals(route.RouteId, StringComparison.OrdinalIgnoreCase));
                    _routes.Add(route);
                    _routeFiles[route.RouteId] = fileName;
                }
            }

            if (reverseProxy.TryGetProperty("Clusters", out var clusters))
            {
                foreach (var clusterElement in clusters.EnumerateObject())
                {
                    var cluster = new YarpCluster
                    {
                        ClusterId = clusterElement.Name,
                        LoadBalancingPolicy = clusterElement.Value.TryGetProperty("LoadBalancingPolicy", out var policy)
                            ? policy.GetString()
                            : null
                    };

                    if (clusterElement.Value.TryGetProperty("Destinations", out var destinations))
                    {
                        foreach (var destination in destinations.EnumerateObject())
                        {
                            cluster.Destinations[destination.Name] = GetString(destination.Value, "Address");
                        }
                    }

                    _clusters.RemoveAll(c => c.ClusterId.Equals(cluster.ClusterId, StringComparison.OrdinalIgnoreCase));
                    _clusters.Add(cluster);
                    _clusterFiles[cluster.ClusterId] = fileName;
                }
            }
        }

        private void SaveFile(string fileName)
        {
            var routeMap = new SortedDictionary<string, object>(StringComparer.OrdinalIgnoreCase);
            foreach (var route in _routes.Where(r => _routeFiles.GetValueOrDefault(r.RouteId) == fileName).OrderBy(r => r.RouteId))
            {
                routeMap[route.RouteId] = new
                {
                    route.ClusterId,
                    Match = new { Path = route.MatchPath },
                    Transforms = route.Transforms,
                    route.Enabled
                };
            }

            var clusterMap = new SortedDictionary<string, object>(StringComparer.OrdinalIgnoreCase);
            foreach (var cluster in _clusters.Where(c => _clusterFiles.GetValueOrDefault(c.ClusterId) == fileName).OrderBy(c => c.ClusterId))
            {
                var clusterConfig = new Dictionary<string, object?>
                {
                    ["Destinations"] = cluster.Destinations.ToDictionary(
                        d => d.Key,
                        d => new { Address = d.Value })
                };

                if (!string.IsNullOrWhiteSpace(cluster.LoadBalancingPolicy))
                {
                    clusterConfig["LoadBalancingPolicy"] = cluster.LoadBalancingPolicy;
                }

                clusterMap[cluster.ClusterId] = clusterConfig;
            }

            var output = new
            {
                ReverseProxy = new
                {
                    Routes = routeMap,
                    Clusters = clusterMap
                }
            };

            File.WriteAllText(GetPath(fileName), JsonSerializer.Serialize(output, new JsonSerializerOptions { WriteIndented = true }));
        }

        private string GetPath(string fileName) => Path.Combine(_contentRootPath, fileName);

        private static string GetString(JsonElement element, string propertyName)
        {
            return element.TryGetProperty(propertyName, out var property) ? property.GetString() ?? string.Empty : string.Empty;
        }

        private static YarpRoute Clone(YarpRoute route) => new()
        {
            RouteId = route.RouteId,
            ClusterId = route.ClusterId,
            MatchPath = route.MatchPath,
            Enabled = route.Enabled,
            Transforms = route.Transforms.Select(t => new Dictionary<string, string>(t)).ToList()
        };

        private static YarpCluster Clone(YarpCluster cluster) => new()
        {
            ClusterId = cluster.ClusterId,
            LoadBalancingPolicy = cluster.LoadBalancingPolicy,
            Destinations = new Dictionary<string, string>(cluster.Destinations)
        };
    }
}
