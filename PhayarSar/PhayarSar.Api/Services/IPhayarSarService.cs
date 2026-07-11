using PhayarSar.Api.Dtos;

namespace PhayarSar.Api.Services;

public interface IPhayarSarService
{
    PhayarSarGroupListResponseDto GetGroups();
    PhayarSarGroupGetResponseDto GetGroupById(int groupId);
    PhayarSarContentResponseDto GetContent(int groupId, int id);
}
