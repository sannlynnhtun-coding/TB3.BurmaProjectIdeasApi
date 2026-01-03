using BurmeseAgriculture.Api.Dtos;

namespace BurmeseAgriculture.Api.Services
{
    public interface IBurmeseAgricultureService
    {
        AgricultureResponseDto Create(AgricultureCreateRequestDto request);
        AgricultureResponseDto Delete(int id);
        BurmeseAgricultureGetByIdResponseDto GetById(int id);
        BurmeseAgricultureListResponseDto GetList(int pageNo, int pageSize);
        AgricultureResponseDto Patch(int id, AgriculturePatchRequestDto request);
        AgricultureResponseDto Update(int id, AgricultureUpdateRequestDto request);
    }
}