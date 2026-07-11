using System.Text.Json;
using PickAPile.Api.Dtos;
using Microsoft.AspNetCore.Hosting;

namespace PickAPile.Api.Services;

public class PickAPileService : IPickAPileService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<QuestionDto> _questions;
    private readonly List<AnswerDto> _answers;

    public PickAPileService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "PickAPile.json");
        var json = File.ReadAllText(filePath);
        var rawData = JsonSerializer.Deserialize<PickAPileJsonModel>(json, JsonOptions)
            ?? new PickAPileJsonModel();

        _questions = rawData.Questions.Select(q => new QuestionDto
        {
            QuestionId = q.QuestionId,
            QuestionName = q.QuestionName,
            QuestionDesp = q.QuestionDesp
        }).ToList();

        _answers = rawData.Answers.Select(a => new AnswerDto
        {
            AnswerId = a.AnswerId,
            AnswerImageUrl = a.AnswerImageUrl,
            AnswerName = a.AnswerName,
            AnswerDesp = a.AnswerDesp,
            QuestionId = a.QuestionId
        }).ToList();
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

    public QuestionGetResponseDto GetQuestionById(int id)
    {
        try
        {
            var question = _questions.FirstOrDefault(q => q.QuestionId == id);
            if (question == null)
            {
                return new QuestionGetResponseDto
                {
                    IsSuccess = false,
                    Message = $"Question ID {id} not found."
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

    public AnswerListResponseDto GetAnswersByQuestionId(int questionId)
    {
        try
        {
            var answers = _answers.Where(a => a.QuestionId == questionId).ToList();
            return new AnswerListResponseDto
            {
                IsSuccess = true,
                Message = $"Answers for question ID {questionId} retrieved successfully.",
                Answers = answers
            };
        }
        catch (Exception ex)
        {
            return new AnswerListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving answers: {ex.Message}"
            };
        }
    }

    public AnswerGetResponseDto GetAnswer(int questionId, int answerId)
    {
        try
        {
            var answer = _answers.FirstOrDefault(a => a.QuestionId == questionId && a.AnswerId == answerId);
            if (answer == null)
            {
                return new AnswerGetResponseDto
                {
                    IsSuccess = false,
                    Message = $"Answer ID {answerId} not found for question ID {questionId}."
                };
            }

            return new AnswerGetResponseDto
            {
                IsSuccess = true,
                Message = "Answer retrieved successfully.",
                Answer = answer
            };
        }
        catch (Exception ex)
        {
            return new AnswerGetResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving the answer: {ex.Message}"
            };
        }
    }
}

