using System;
using Abp.Application.Services.Dto;

namespace UET.EasyAccommod.Note.Dto.InputCreate
{
    public class CreateOrUpdateNoteInput : EntityDto<long>
    {
        public long UserId { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
        public DateTime Date { get; set; }
        public string TitleNote { get; set; }
        public string DetailNote { get; set; }
        public bool Status { get; set; }
    }
}
