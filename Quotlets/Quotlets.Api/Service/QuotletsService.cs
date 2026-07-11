using System.Text.Json;
using Quotlets.Api.Dtos;

namespace Quotlets.Api.Service
{
    public class QuotletsService: IQuotletsService
    {
        private static readonly JsonSerializerOptions JsonOptions = new()
        {
            PropertyNameCaseInsensitive = true
        };

        private readonly List<QuotletsDto> _quotlets;

        public QuotletsService(IWebHostEnvironment env)
        {
            var filePath = Path.Combine(env.ContentRootPath, "Data", "Quotlets.json");
            var json = File.ReadAllText(filePath);
            _quotlets = JsonSerializer.Deserialize<List<QuotletsDto>>(json, JsonOptions)
                ?? new List<QuotletsDto>();
        }

        public QuotletsListResponseDto Get(int pageNo, int pageSize)
        {
            try
            {
                if (pageNo <= 0 || pageSize <= 0)
                {
                    return new QuotletsListResponseDto
                    {
                        IsSuccess = false,
                        Message = "Invalid page number or page size.",
                        QuotletsList = new List<QuotletsDto>()
                    };
                }

                var quotletsList = _quotlets
                    .Skip((pageNo - 1) * pageSize)
                    .Take(pageSize)
                    .ToList();

                return new QuotletsListResponseDto
                {
                    IsSuccess = true,
                    Message = "Quotlets retrieved successfully.",
                    QuotletsList = quotletsList
                };
            }
            catch (Exception)
            {
                return new QuotletsListResponseDto
                {
                    IsSuccess = false,
                    Message = "An error occurred while retrieving quotlets.",
                    QuotletsList = new List<QuotletsDto>()
                };
            }
        }

        public QuotletsGetByIdResponseDto GetById(string id)
        {
            try
            {
                var quotlet = _quotlets.FirstOrDefault(q => q.Id == id);
                if (quotlet is null)
                {
                    return new QuotletsGetByIdResponseDto
                    {
                        IsSuccess = false,
                        Message = "Quotlet not found.",
                        QuotletsDto = null
                    };
                }

                return new QuotletsGetByIdResponseDto
                {
                    IsSuccess = true,
                    Message = "Quotlet retrieved successfully.",
                    QuotletsDto = quotlet
                };
            }
            catch (Exception)
            {
                return new QuotletsGetByIdResponseDto
                {
                    IsSuccess = false,
                    Message = "An error occurred while retrieving the quotlet."
                };
            }
        }

        public QuotletsResponseDto Create(QuotletsCreateRequestDto request) => ReadOnly();

        public QuotletsResponseDto Update(string id, QuotletsUpdateRequestDto request) => ReadOnly();

        public QuotletsResponseDto Delete(string id) => ReadOnly();

        private static QuotletsResponseDto ReadOnly() => new()
        {
            IsSuccess = false,
            Message = "Read-only JSON data source."
        };

    }
}
