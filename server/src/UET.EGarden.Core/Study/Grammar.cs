using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace UET.EGarden.Study
{
    [Table("Grammar")]

    public class Grammar : FullAuditedEntity<long>, IEntity<long>
    {
        public long? BookId { get; set; }
        public long? UnitId { get; set; }
        public string Key { get; set; }
        public string Meaning { get; set; }
        public string Example { get; set; }
    }
}
