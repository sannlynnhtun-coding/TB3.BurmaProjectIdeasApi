using LatHtaukBayDin.Api.Dtos;

namespace LatHtaukBayDin.Api.Services;

public interface ILatHtaukBayDinService
{
    QuestionListResponseDto GetQuestions();
    QuestionGetResponseDto GetQuestionByNo(int questionNo);
    NumberListResponseDto GetNumberList();
    AnswerResponseDto GetAnswer(int questionNo, int answerNo);
    AnswerResponseDto GetAnswerByIndex(int questionNo, int gridIndex);
}

