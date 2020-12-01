using Abp.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace UET.EasyAccommod.Study.Dto.Unit
{
    public class DetailUnitDto : Entity<long>
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public long BookId { get; set; }
        public long TotalWord { get; set; }
        public long TotalSentence { get; set; }
    }
}
