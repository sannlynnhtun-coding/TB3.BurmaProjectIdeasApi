using BurmeseAgriculture.Api.Dtos;
using BurmeseAgriculture.Database.AppDbContextModels;

namespace BurmeseAgriculture.Api.Services;

public class BurmeseAgricultureService : IBurmeseAgricultureService
{
    private readonly AppDbContext _appDbContext;

    public BurmeseAgricultureService(AppDbContext appDbContext)
    {
        _appDbContext = appDbContext;
    }

    public BurmeseAgricultureListResponseDto GetList(int pageNo, int pageSize)
    {
        BurmeseAgricultureListResponseDto dto = new BurmeseAgricultureListResponseDto();
        if (pageNo == 0)
        {
            dto = new BurmeseAgricultureListResponseDto()
            {
                IsSuccess = false,
                Message = "Page number must be greater than zero."
            };
            return dto;
        }
        if (pageSize == 0)
        {
            dto = new BurmeseAgricultureListResponseDto()
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero."
            };
            return dto;
        }

        var lst = _appDbContext.TblBurmeseAgricultures
            .Where(x => x.DeleteFlag == false)
            .OrderByDescending(x => x.Id)
            .Skip((pageNo - 1) * pageSize)
            .Take(pageSize)
            .ToList();

        var agricultures = lst.Select(x => new BurmeseAgricultureListItemDto
        {
            Id = x.Id,
            Author = x.Author,
            Date = x.Date,
            Title = x.Title,
        }).ToList();

        dto = new BurmeseAgricultureListResponseDto
        {
            IsSuccess = true,
            Message = "Data retrieved successfullly.",
            BurmeseAgricultureList = agricultures
        };

        return dto;
    }

    public BurmeseAgricultureGetByIdResponseDto GetById(int id)
    {
        BurmeseAgricultureGetByIdResponseDto dto = new BurmeseAgricultureGetByIdResponseDto();

        var item = _appDbContext.TblBurmeseAgricultures
            .Where(x => x.DeleteFlag == false)
            .FirstOrDefault(x => x.Id == id);

        if (item is null)
        {
            dto = new BurmeseAgricultureGetByIdResponseDto
            {
                IsSuccess = false,
                Message = "No data found.",
                BurmeseAgricultureDto = null
            };

            return dto;
        }

        var agriculture = new BurmeseAgricultureDto
        {
            Id = item.Id,
            Author = item.Author,
            Date = item.Date,
            Title = item.Title,
            Content = item.Content,
        };

        dto = new BurmeseAgricultureGetByIdResponseDto
        {
            IsSuccess = true,
            Message = "Data is retrieved successfully.",
            BurmeseAgricultureDto = agriculture
        };

        return dto;
    }

    public AgricultureResponseDto Create(AgricultureCreateRequestDto request)
    {
        bool isSuccess = false;
        string message = string.Empty;
        AgricultureResponseDto dto = new AgricultureResponseDto();

        if (string.IsNullOrEmpty(request.Title))
        {
            message = "Title cannot be empty.";
            goto Response;
        }

        if (string.IsNullOrEmpty(request.Author))
        {
            message = "Author cannot be empty.";
            goto Response;
        }

        if (string.IsNullOrEmpty(request.Content))
        {
            message = "Content cannot be empty.";
            goto Response;
        }

        _appDbContext.TblBurmeseAgricultures.Add(new TblBurmeseAgriculture
        {
            Title = request.Title,
            Author = request.Author,
            Content = request.Content,
            Date = request.Date,
            DeleteFlag = false
        });

        int result = _appDbContext.SaveChanges();

        message = "Saving Failed.";
        if (result > 0)
        {
            isSuccess = true;
            message = "Saving Successful.";
        }

    Response:
        dto.IsSuccess = isSuccess;
        dto.Message = message;
        return dto;
    }

    public AgricultureResponseDto Update(int id, AgricultureUpdateRequestDto request)
    {
        bool isSuccess = false;
        string message = string.Empty;
        AgricultureResponseDto dto = new AgricultureResponseDto();

        if (string.IsNullOrEmpty(request.Title))
        {
            message = "Title cannot be empty.";
            goto Response;
        }

        if (string.IsNullOrEmpty(request.Author))
        {
            message = "Author cannot be empty.";
            goto Response;
        }

        if (string.IsNullOrEmpty(request.Content))
        {
            message = "Content cannot be empty.";
            goto Response;
        }

        var item = _appDbContext.TblBurmeseAgricultures
            .Where(x => x.DeleteFlag == false)
            .FirstOrDefault(x => x.Id == id);

        if (item is null)
        {
            message = "Data not found.";
            goto Response;
        }

        item.Title = request.Title;
        item.Author = request.Author;
        item.Content = request.Content;
        item.Date = request.Date;

        int result = _appDbContext.SaveChanges();

        message = "Updating Failed.";
        if (result > 0)
        {
            isSuccess = true;
            message = "Updating Successful.";
        }

    Response:
        dto.IsSuccess = isSuccess;
        dto.Message = message;
        return dto;
    }


    public AgricultureResponseDto Patch(int id, AgriculturePatchRequestDto request)
    {
        bool isSuccess = false;
        string message = string.Empty;
        AgricultureResponseDto dto = new AgricultureResponseDto();

        if (string.IsNullOrEmpty(request.Title)
            && string.IsNullOrEmpty(request.Author)
            && string.IsNullOrEmpty(request.Content)
            && request.Date is null)
        {
            message = "No data to update.";
            goto Response;
        }

        var item = _appDbContext.TblBurmeseAgricultures
            .Where(x => x.DeleteFlag == false)
            .FirstOrDefault(x => x.Id == id);

        if (item is null)
        {
            message = "Data not found.";
            goto Response;
        }

        if (!string.IsNullOrEmpty(request.Title))
            item.Title = request.Title;

        if (!string.IsNullOrEmpty(request.Author))
            item.Author = request.Author;

        if (!string.IsNullOrEmpty(request.Content))
            item.Content = request.Content;

        if (request.Date is not null)
            item.Date = request.Date.Value;

        int result = _appDbContext.SaveChanges();

        message = "Patching Failed.";
        if (result > 0)
        {
            isSuccess = true;
            message = "Patching Successful.";
        }

    Response:
        dto.IsSuccess = isSuccess;
        dto.Message = message;
        return dto;
    }

    public AgricultureResponseDto Delete(int id)
    {
        AgricultureResponseDto dto = new AgricultureResponseDto();

        if (id <= 0)
        {
            dto.Message = "Invalid Id.";
            goto Response;
        }

        var item = _appDbContext.TblBurmeseAgricultures
            .Where(x => x.DeleteFlag == false)
            .FirstOrDefault(x => x.Id == id);

        if (item is null)
        {
            dto.Message = "Data not found.";
            goto Response;
        }

        item.DeleteFlag = true;
        int result = _appDbContext.SaveChanges();

        if (result < 1)
        {
            dto.Message = "Deleting Failed.";
            goto Response;
        }

        dto.IsSuccess = true;
        dto.Message = "Deleting Successful.";

    Response:
        return dto;
    }

}

