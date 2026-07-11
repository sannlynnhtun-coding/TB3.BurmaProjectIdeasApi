using System.Text.Json;
using PhayarSar.Api.Dtos;
using Microsoft.AspNetCore.Hosting;

namespace PhayarSar.Api.Services;

public class PhayarSarService : IPhayarSarService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<PhayarSarGroupDto> _groups;
    private readonly IWebHostEnvironment _env;

    public PhayarSarService(IWebHostEnvironment env)
    {
        _env = env;
        var filePath = Path.Combine(env.ContentRootPath, "Data", "data.json");
        var json = File.ReadAllText(filePath);
        var rawData = JsonSerializer.Deserialize<List<PhayarSarGroupJsonModel>>(json, JsonOptions)
            ?? new List<PhayarSarGroupJsonModel>();

        _groups = rawData.Select(g => new PhayarSarGroupDto
        {
            GroupId = g.GroupId,
            Title = g.Title,
            Data = g.Data.Select(d => new PhayarSarItemDto
            {
                Id = d.Id,
                GroupId = d.GroupId,
                Title = d.Title
            }).ToList()
        }).ToList();
    }

    public PhayarSarGroupListResponseDto GetGroups()
    {
        try
        {
            return new PhayarSarGroupListResponseDto
            {
                IsSuccess = true,
                Message = "PhayarSar groups retrieved successfully.",
                Groups = _groups
            };
        }
        catch (Exception ex)
        {
            return new PhayarSarGroupListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving groups: {ex.Message}"
            };
        }
    }

    public PhayarSarGroupGetResponseDto GetGroupById(int groupId)
    {
        try
        {
            var group = _groups.FirstOrDefault(g => g.GroupId == groupId);
            if (group == null)
            {
                return new PhayarSarGroupGetResponseDto
                {
                    IsSuccess = false,
                    Message = $"Group ID {groupId} not found."
                };
            }

            return new PhayarSarGroupGetResponseDto
            {
                IsSuccess = true,
                Message = "Group retrieved successfully.",
                Group = group
            };
        }
        catch (Exception ex)
        {
            return new PhayarSarGroupGetResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving the group: {ex.Message}"
            };
        }
    }

    public PhayarSarContentResponseDto GetContent(int groupId, int id)
    {
        try
        {
            // Verify group and item exist in metadata list
            var group = _groups.FirstOrDefault(g => g.GroupId == groupId);
            if (group == null)
            {
                return new PhayarSarContentResponseDto
                {
                    IsSuccess = false,
                    Message = $"Group ID {groupId} not found."
                };
            }

            var item = group.Data.FirstOrDefault(i => i.Id == id);
            if (item == null)
            {
                return new PhayarSarContentResponseDto
                {
                    IsSuccess = false,
                    Message = $"Item ID {id} not found in Group ID {groupId}."
                };
            }

            // Construct path to specific detail file: Data/{groupId}/{id}.json
            var detailPath = Path.Combine(_env.ContentRootPath, "Data", groupId.ToString(), $"{id}.json");
            if (!File.Exists(detailPath))
            {
                return new PhayarSarContentResponseDto
                {
                    IsSuccess = false,
                    Message = $"Detail file not found for Group ID {groupId}, Item ID {id}."
                };
            }

            var json = File.ReadAllText(detailPath);
            var contentModel = JsonSerializer.Deserialize<PhayarSarContentJsonModel>(json, JsonOptions);

            if (contentModel == null)
            {
                return new PhayarSarContentResponseDto
                {
                    IsSuccess = false,
                    Message = $"Could not parse the content file for Group ID {groupId}, Item ID {id}."
                };
            }

            return new PhayarSarContentResponseDto
            {
                IsSuccess = true,
                Message = "Content retrieved successfully.",
                Content = new PhayarSarContentDto
                {
                    Id = contentModel.Id,
                    GroupId = contentModel.GroupId,
                    Title = contentModel.Title,
                    Content = contentModel.Content
                }
            };
        }
        catch (Exception ex)
        {
            return new PhayarSarContentResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving the content: {ex.Message}"
            };
        }
    }
}
