namespace BurmaProjectIdeasYarp.Models
{
    public class YarpCluster
    {
        public string ClusterId { get; set; } = string.Empty;
        public Dictionary<string, string> Destinations { get; set; } = new();
        public string? LoadBalancingPolicy { get; set; }
    }
}
