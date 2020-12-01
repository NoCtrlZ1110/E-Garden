using Abp.Application.Services;
using Abp.Application.Services.Dto;
using System.Threading.Tasks;
using UET.EasyAccommod.Study.Dto.Book;
using UET.EasyAccommod.Study.Dto.Unit;
using UET.EasyAccommod.Study.Dto.Vocabulary;

namespace UET.EasyAccommod.Study
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
