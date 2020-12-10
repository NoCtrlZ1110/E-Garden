using Abp.Application.Services.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace UET.EGarden.Study.Dto.Grammar
{
    public class ListGrammarDto : EntityDto<long>
    {
        public long BookId { get; set; }
        public long UnitId { get; set; }
        public string Key { get; set; }
        public string Meaning { get; set; }
        public string Example { get; set; }
    }
}
