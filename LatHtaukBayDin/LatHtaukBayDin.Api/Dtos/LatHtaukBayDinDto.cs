namespace LatHtaukBayDin.Api.Dtos;

public class LatHtaukBayDinJsonModel
{
    public List<QuestionJsonModel> Questions { get; set; } = new();
    public List<AnswerJsonModel> Answers { get; set; } = new();
    public List<string> NumberList { get; set; } = new();
}

public class QuestionJsonModel
{
    public int QuestionNo { get; set; }
    public string QuestionName { get; set; } = null!;
}

public class AnswerJsonModel
{
    public int QuestionNo { get; set; }
    public int AnswerNo { get; set; }
    public string AnswerResult { get; set; } = null!;
}

public class QuestionDto
{
    public int QuestionNo { get; set; }
    public string QuestionName { get; set; } = null!;
}

public class AnswerDto
{
    public int QuestionNo { get; set; }
    public int AnswerNo { get; set; }
    public string AnswerResult { get; set; } = null!;
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

public class NumberListResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<string> NumberList { get; set; } = new();
}

public class AnswerResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public AnswerDto? Answer { get; set; }
}

public class LatHtaukBayDinResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
}

