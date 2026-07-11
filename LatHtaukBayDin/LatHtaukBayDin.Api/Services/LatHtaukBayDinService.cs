using System.Text.Json;
using LatHtaukBayDin.Api.Dtos;
using Microsoft.AspNetCore.Hosting;

namespace LatHtaukBayDin.Api.Services;

public class LatHtaukBayDinService : ILatHtaukBayDinService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private static readonly Dictionary<string, int> MyanmarToEnglishMap = new()
    {
        { "၁", 1 },
        { "၂", 2 },
        { "၃", 3 },
        { "၄", 4 },
        { "၅", 5 },
        { "၆", 6 },
        { "၇", 7 },
        { "၈", 8 },
        { "၉", 9 },
        { "၁၀", 10 }
    };

    private readonly List<QuestionDto> _questions;
    private readonly List<AnswerDto> _answers;
    private readonly List<string> _numberList;

    public LatHtaukBayDinService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "MinTheinKha.LatHtaukBayDin.json");
        var json = File.ReadAllText(filePath);
        var rawData = JsonSerializer.Deserialize<LatHtaukBayDinJsonModel>(json, JsonOptions)
            ?? new LatHtaukBayDinJsonModel();

        _questions = rawData.Questions.Select(q => new QuestionDto
        {
            QuestionNo = q.QuestionNo,
            QuestionName = q.QuestionName
        }).ToList();

        _answers = rawData.Answers.Select(a => new AnswerDto
        {
            QuestionNo = a.QuestionNo,
            AnswerNo = a.AnswerNo,
            AnswerResult = a.AnswerResult
        }).ToList();

        _numberList = rawData.NumberList;
    }

    public QuestionListResponseDto GetQuestions()
    {
        try
        {
            return new QuestionListResponseDto
            {
                IsSuccess = true,
                Message = "Questions retrieved successfully.",
                Questions = _questions
            };
        }
        catch (Exception ex)
        {
            return new QuestionListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving questions: {ex.Message}"
            };
        }
    }

    public QuestionGetResponseDto GetQuestionByNo(int questionNo)
    {
        try
        {
            var question = _questions.FirstOrDefault(q => q.QuestionNo == questionNo);
            if (question == null)
            {
                return new QuestionGetResponseDto
                {
                    IsSuccess = false,
                    Message = $"Question number {questionNo} not found."
                };
            }

            return new QuestionGetResponseDto
            {
                IsSuccess = true,
                Message = "Question retrieved successfully.",
                Question = question
            };
        }
        catch (Exception ex)
        {
            return new QuestionGetResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving the question: {ex.Message}"
            };
        }
    }

    public NumberListResponseDto GetNumberList()
    {
        try
        {
            return new NumberListResponseDto
            {
                IsSuccess = true,
                Message = "Number list retrieved successfully.",
                NumberList = _numberList
            };
        }
        catch (Exception ex)
        {
            return new NumberListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving the number list: {ex.Message}"
            };
        }
    }

    public AnswerResponseDto GetAnswer(int questionNo, int answerNo)
    {
        try
        {
            if (questionNo < 1 || questionNo > 64)
            {
                return new AnswerResponseDto
                {
                    IsSuccess = false,
                    Message = "Invalid question number. Question number must be between 1 and 64."
                };
            }

            if (answerNo < 1 || answerNo > 10)
            {
                return new AnswerResponseDto
                {
                    IsSuccess = false,
                    Message = "Invalid answer number. Answer number must be between 1 and 10."
                };
            }

            var answer = _answers.FirstOrDefault(a => a.QuestionNo == questionNo && a.AnswerNo == answerNo);
            if (answer == null)
            {
                return new AnswerResponseDto
                {
                    IsSuccess = false,
                    Message = $"Answer not found for question No {questionNo} and answer No {answerNo}."
                };
            }

            return new AnswerResponseDto
            {
                IsSuccess = true,
                Message = "Answer retrieved successfully.",
                Answer = answer
            };
        }
        catch (Exception ex)
        {
            return new AnswerResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving the answer: {ex.Message}"
            };
        }
    }

    public AnswerResponseDto GetAnswerByIndex(int questionNo, int gridIndex)
    {
        try
        {
            if (gridIndex < 0 || gridIndex >= _numberList.Count)
            {
                return new AnswerResponseDto
                {
                    IsSuccess = false,
                    Message = $"Invalid grid index. Grid index must be between 0 and {_numberList.Count - 1}."
                };
            }

            var myanmarNumeral = _numberList[gridIndex];
            if (!MyanmarToEnglishMap.TryGetValue(myanmarNumeral, out int answerNo))
            {
                return new AnswerResponseDto
                {
                    IsSuccess = false,
                    Message = $"Failed to map Myanmar numeral '{myanmarNumeral}' to an answer number."
                };
            }

            return GetFortune(questionNo, answerNo);
        }
        catch (Exception ex)
        {
            return new AnswerResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving the answer by index: {ex.Message}"
            };
        }
    }
}

