using MyanmarProverbs.Api.Dtos;

namespace MyanmarProverbs.Api.Services;

public interface IMyanmarProverbService
{
    ProverbTitleListResponseDto GetProverbTitles();
    ProverbListResponseDto GetProverbs(int pageNo, int pageSize);
    ProverbListResponseDto GetProverbsByTitleId(int titleId);
    ProverbGetResponseDto GetProverb(int titleId, int proverbId);
    ProverbListResponseDto SearchProverbs(string keyword);
}

