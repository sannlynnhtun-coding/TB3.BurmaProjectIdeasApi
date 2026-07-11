using Quotlets.Api.Dtos;

namespace Quotlets.Api.Service
{
    public interface IQuotletsService
    {
        QuotletsListResponseDto Get(int pageNo, int pageSize);
        QuotletsGetByIdResponseDto GetById(string id);
        QuotletsResponseDto Create(QuotletsCreateRequestDto request);
        QuotletsResponseDto Update(string id, QuotletsUpdateRequestDto request);
        QuotletsResponseDto Delete(string id);
    }
}
