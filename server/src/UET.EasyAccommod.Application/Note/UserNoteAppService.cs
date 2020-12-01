using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Abp.Application.Services.Dto;
using Abp.Domain.Repositories;
using UET.EasyAccommod.Note.Dto.InputCreate;
using UET.EasyAccommod.Note.Dto.InputGet;
using UET.EasyAccommod.Note.Dto.Output;

namespace UET.EasyAccommod.Note
{
    public class UserNoteAppService : EasyAccommodAppServiceBase, IUserNoteAppService
    {
        private readonly IRepository<UserNote, long> _UserNoteRepo;

        public UserNoteAppService(IRepository<UserNote, long> userNoteRepo)
        {
            _UserNoteRepo = userNoteRepo;
        }

        public async Task CreateOrUpdateNote(CreateOrUpdateNoteInput input)
        {
            if (input.Id == 0)
            {
                await Create(input);
            }
            else
            {
                await Update(input);
            }
        }

        public async Task<DetailNoteDto> GetDetailNote(GetDetailNoteInput input)
        {
            var noteDetail = await _UserNoteRepo.FirstOrDefaultAsync(input.NoteId);
            return ObjectMapper.Map<DetailNoteDto>(noteDetail);
        }

        public ListResultDto<ListNoteByUserIdDto> GetListNoteByUser(GetListNoteByUserInput input)
        {
            var listNote = _UserNoteRepo.GetAll().Where(un => un.UserId == input.UserId);
            return new ListResultDto<ListNoteByUserIdDto>(ObjectMapper.Map<List<ListNoteByUserIdDto>>(listNote));
        }

        public async Task SetDoneNoteStatus(SetDoneNoteStatusInput input)
        {
            var note = await _UserNoteRepo.GetAsync(input.Id);
            note.Status = input.Status;
            await _UserNoteRepo.UpdateAsync(note);
        }
        protected async Task Create(CreateOrUpdateNoteInput input)
        {
            var note = ObjectMapper.Map<UserNote>(input);
            await _UserNoteRepo.InsertAsync(note);
        }
        protected async Task Update(CreateOrUpdateNoteInput input)
        {
            var note = _UserNoteRepo.FirstOrDefaultAsync(input.Id);
            await ObjectMapper.Map(input, note);
        }
    }
}
