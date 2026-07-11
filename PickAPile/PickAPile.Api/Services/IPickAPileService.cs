using PickAPile.Api.Dtos;

namespace PickAPile.Api.Services;

public interface IPickAPileService
{
    QuestionListResponseDto GetQuestions();
    QuestionGetResponseDto GetQuestionById(int id);
    AnswerListResponseDto GetAnswersByQuestionId(int questionId);
    AnswerGetResponseDto GetAnswer(int questionId, int answerId);
}

