using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using UET.EGarden.Note.Dto.InputCreate;
using UET.EGarden.Note.Dto.InputGet;
using UET.EGarden.Note.Dto.Output;

namespace UET.EGarden.Note
{
    public interface IUserNoteAppService : IApplicationService
    {
        ListResultDto<ListNoteByUserIdDto> GetListNoteByUser(GetListNoteByUserInput input);
        Task<DetailNoteDto> GetDetailNote(GetDetailNoteInput input);
        Task CreateOrUpdateNote(CreateOrUpdateNoteInput input);
        Task SetDoneNoteStatus(SetDoneNoteStatusInput input);
    }
}
