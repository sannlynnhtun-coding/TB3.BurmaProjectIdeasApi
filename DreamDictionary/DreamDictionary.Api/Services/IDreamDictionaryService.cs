using DreamDictionary.Api.Dtos;

namespace DreamDictionary.Api.Services;

public interface IDreamDictionaryService
{
    BlogHeaderListResponseDto GetBlogHeaders(int pageNo, int pageSize);
    BlogDetailListResponseDto GetBlogDetails(int pageNo, int pageSize);
    BlogDetailListResponseDto GetBlogDetailsByHeaderId(int blogHeaderId);
    BlogDetailResponseDto GetBlogDetailById(int blogDetailId);
    BlogDetailListResponseDto SearchDreams(string search);
    DreamDictionaryResponseDto CreateBlogDetail(BlogDetailCreateRequestDto request);
    DreamDictionaryResponseDto UpdateBlogDetail(int id, BlogDetailUpdateRequestDto request);
    DreamDictionaryResponseDto DeleteBlogDetail(int id);
}

