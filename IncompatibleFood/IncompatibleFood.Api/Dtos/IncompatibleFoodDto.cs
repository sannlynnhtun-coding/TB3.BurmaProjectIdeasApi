namespace IncompatibleFood.Api.Dtos
{
    public class IncompatibleFoodDto
    {
        public int Id { get; set; }

        public string FoodA { get; set; } = null!;

        public string FoodB { get; set; } = null!;

        public string Description { get; set; } = null!;
    }

    public class IncompatibleFoodCreateRequestDto
    {
        public string FoodA { get; set; } = null!;

        public string FoodB { get; set; } = null!;

        public string Description { get; set; } = null!;
    }

    public class IncompatibleFoodUpdateRequestDto
    {
        public string FoodA { get; set; } = null!;

        public string FoodB { get; set; } = null!;

        public string Description { get; set; } = null!;
    }

    public class IncompatibleFoodPatchRequestDto
    {
        public string? FoodA { get; set; } = null!;

        public string? FoodB { get; set; } = null!;

        public string? Description { get; set; } = null!;
    }
    public class IncompatibleFoodResponseDto
    {
        public bool IsSuccess { get; set; } = false;
        public string Message { get; set; } = string.Empty;
    }

    public class IncompatibleFoodGetResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
        public List<IncompatibleFoodDto> IncompatibleFoods { get; set; }
    }

    public class IncompatibleFoodGetByIdResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
        public IncompatibleFoodDto IncompatibleFood { get; set; }
    }

}
