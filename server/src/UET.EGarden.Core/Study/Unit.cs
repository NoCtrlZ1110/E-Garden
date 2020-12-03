using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations.Schema;

namespace UET.EGarden.Study
{
    [Table("Unit")]
    public class Unit : FullAuditedEntity<long>, IEntity<long>
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public long BookId { get; set; }
        public long TotalWord { get; set; }
        public long TotalSentence { get; set; }
    }
}
