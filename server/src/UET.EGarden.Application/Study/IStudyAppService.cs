using Abp.Application.Services;
using Abp.Application.Services.Dto;
using System.Threading.Tasks;
using UET.EGarden.Study.Dto.Book;
using UET.EGarden.Study.Dto.Unit;
using UET.EGarden.Study.Dto.Vocabulary;

namespace UET.EGarden.Study
{
    public interface IBookAppService : IApplicationService
    {
        ListResultDto<ListBookDto> GetListBook();
        Task<DetailBookDto> GetBookDetail(long BookId);
        ListResultDto<ListUnitDto> GetListUnit(long bookId);
        Task<DetailUnitDto> GetUnitDetail(long unitId);
        ListResultDto<ListVocabularyDto> GetListVocabulary(GetListVocabularyInput input);

    }

}
