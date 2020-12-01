using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using UET.EasyAccommod.Note.Dto.InputCreate;
using UET.EasyAccommod.Note.Dto.InputGet;
using UET.EasyAccommod.Note.Dto.Output;

namespace UET.EasyAccommod.Note
{
    public interface IUserNoteAppService : IApplicationService
    {
        ListResultDto<ListNoteByUserIdDto> GetListNoteByUser(GetListNoteByUserInput input);
        Task<DetailNoteDto> GetDetailNote(GetDetailNoteInput input);
        Task CreateOrUpdateNote(CreateOrUpdateNoteInput input);
        Task SetDoneNoteStatus(SetDoneNoteStatusInput input);
    }
}
