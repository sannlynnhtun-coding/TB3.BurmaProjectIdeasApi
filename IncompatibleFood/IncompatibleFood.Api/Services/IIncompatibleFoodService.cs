using IncompatibleFood.Api.Controllers;
using IncompatibleFood.Api.Dtos;

namespace IncompatibleFood.Api.Services
{
    public interface IIncompatibleFoodService
    {

        IncompatibleFoodResponseDto CreateIncompatibleFood(IncompatibleFoodCreateRequestDto requestDto);
        //IncompatibleFoodResponseDto DeleteIncompatibleFood(int id);
        IncompatibleFoodGetByIdResponseDto GetIncompatibleFoodById(int id);
        IncompatibleFoodGetResponseDto GetIncompatibleFoods(int pageNo, int pageSize);
        IncompatibleFoodResponseDto PatchIncompatibleFood(int id, IncompatibleFoodPatchRequestDto requestDto);
        IncompatibleFoodResponseDto UpdateIncompatibleFood(int id, IncompatibleFoodUpdateRequestDto requestDto);
    }
}
