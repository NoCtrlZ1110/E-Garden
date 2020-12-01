using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations.Schema;

namespace UET.EasyAccommod.Study
{

    [Table("Vocabulary")]
    public class Vocabulary : FullAuditedEntity<long>, IEntity<long>
    {
        public long BookId { get; set; }
        public long UnitId { get; set; }
        public string Key { get; set; }
        public string Meaning { get; set; }
        public string Sound { get; set; }
        public string Type { get; set; }
        public string Example { get; set; }
        public long Ordering { get; set; }
    }
}
