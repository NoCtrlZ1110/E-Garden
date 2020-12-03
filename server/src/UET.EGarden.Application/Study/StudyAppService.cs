using Abp.Application.Services.Dto;
using Abp.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UET.EGarden.Study.Dto.Book;
using UET.EGarden.Study.Dto.Unit;
using UET.EGarden.Study.Dto.Vocabulary;

namespace UET.EGarden.Study
{
    public class StudyAppService : EGardenAppServiceBase, IBookAppService
    {
        private readonly IRepository<Book, long> _bookRepo;
        private readonly IRepository<Unit, long> _unitRepo;
        private readonly IRepository<Vocabulary, long> _vocabularyRepo;

        public StudyAppService(IRepository<Book, long> bookRepo,
                               IRepository<Unit, long> unitRepo,
                               IRepository<Vocabulary, long> vocabularyRepo)
        {
            _bookRepo = bookRepo;
            _unitRepo = unitRepo;
            _vocabularyRepo = vocabularyRepo;
        }

        public async Task<DetailBookDto> GetBookDetail(long BookId)
        {
            var book = await _bookRepo.FirstOrDefaultAsync(BookId);
            return ObjectMapper.Map<DetailBookDto>(book);
        }

        public ListResultDto<ListBookDto> GetListBook()
        {
            var ListBook = _bookRepo.GetAll().ToList();
            return new ListResultDto<ListBookDto>(ObjectMapper.Map<List<ListBookDto>>(ListBook));
        }

        public ListResultDto<ListUnitDto> GetListUnit(long bookId)
        {
            var listUnit = _unitRepo.GetAll().Where(u => u.BookId == bookId).ToList();
            return new ListResultDto<ListUnitDto>(ObjectMapper.Map<List<ListUnitDto>>(listUnit));
        }

        public ListResultDto<ListVocabularyDto> GetListVocabulary(GetListVocabularyInput input)
        {
            var listVocabulary = _vocabularyRepo.GetAll().Where(v => v.BookId == input.BookId && v.UnitId == input.UnitId).OrderBy(v => v.Ordering).ToList();
            return new ListResultDto<ListVocabularyDto>(ObjectMapper.Map<List<ListVocabularyDto>>(listVocabulary));
        }

        public async Task<DetailUnitDto> GetUnitDetail(long unitId)
        {
            var unit = await _unitRepo.FirstOrDefaultAsync(unitId);
            return ObjectMapper.Map<DetailUnitDto>(unit);
        }
    }
}
