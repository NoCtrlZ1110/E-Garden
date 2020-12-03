using System;
using System.Collections.Generic;
using System.Text;
using Abp.Application.Services.Dto;

namespace UET.EGarden.Note.Dto.InputCreate
{
    public class SetDoneNoteStatusInput : EntityDto<long>
    {
        public bool Status { get; set; }
    }
}
