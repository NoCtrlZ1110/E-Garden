using System;
using System.Collections.Generic;
using System.Text;
using Abp.Application.Services.Dto;

namespace UET.EGarden.Note.Dto.Output
{
    public class DetailNoteDto : EntityDto<long>
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
