using AutoMapper;
using UET.EasyAccommod.Note;
using UET.EasyAccommod.Note.Dto.InputCreate;
using UET.EasyAccommod.Note.Dto.Output;
using UET.EasyAccommod.Study;
using UET.EasyAccommod.Study.Dto.Book;
using UET.EasyAccommod.Study.Dto.Unit;
using UET.EasyAccommod.Study.Dto.Vocabulary;

namespace UET.EasyAccommod
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
