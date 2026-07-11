namespace PickAPile.Api.Dtos;

public class PickAPileJsonModel
{
    public List<QuestionJsonModel> Questions { get; set; } = new();
    public List<AnswerJsonModel> Answers { get; set; } = new();
}

public class QuestionJsonModel
{
    public int QuestionId { get; set; }
    public string QuestionName { get; set; } = null!;
    public string QuestionDesp { get; set; } = null!;
}

public class AnswerJsonModel
{
    public int AnswerId { get; set; }
    public string AnswerImageUrl { get; set; } = null!;
    public string AnswerName { get; set; } = null!;
    public string AnswerDesp { get; set; } = null!;
    public int QuestionId { get; set; }
}

public class QuestionDto
{
    public int QuestionId { get; set; }
    public string QuestionName { get; set; } = null!;
    public string QuestionDesp { get; set; } = null!;
}

public class AnswerDto
{
    public int AnswerId { get; set; }
    public string AnswerImageUrl { get; set; } = null!;
    public string AnswerName { get; set; } = null!;
    public string AnswerDesp { get; set; } = null!;
    public int QuestionId { get; set; }
}

public class QuestionListResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<QuestionDto> Questions { get; set; } = new();
}

public class QuestionGetResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public QuestionDto? Question { get; set; }
}

public class AnswerListResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<AnswerDto> Answers { get; set; } = new();
}

public class AnswerGetResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public AnswerDto? Answer { get; set; }
}

public class PickAPileResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
}

