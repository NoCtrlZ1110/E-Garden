using AutoMapper;
using UET.EGarden.Note;
using UET.EGarden.Note.Dto.InputCreate;
using UET.EGarden.Note.Dto.Output;
using UET.EGarden.Study;
using UET.EGarden.Study.Dto.Book;
using UET.EGarden.Study.Dto.Unit;
using UET.EGarden.Study.Dto.Vocabulary;

namespace UET.EGarden
{
    internal static class CustomDtoMapper
    {
        public static void CreateMappings(IMapperConfigurationExpression configuration)
        {
            configuration.CreateMap<UserNote, DetailNoteDto>();
            configuration.CreateMap<UserNote, ListNoteByUserIdDto>();
            configuration.CreateMap<CreateOrUpdateNoteInput, UserNote>();
            configuration.CreateMap<SetDoneNoteStatusInput, UserNote>();
            configuration.CreateMap<Book, ListBookDto>();
            configuration.CreateMap<Book, DetailBookDto>();
            configuration.CreateMap<Unit, ListUnitDto>();
            configuration.CreateMap<Unit, DetailUnitDto>();
            configuration.CreateMap<Vocabulary, ListVocabularyDto>();
        }
    }
}
