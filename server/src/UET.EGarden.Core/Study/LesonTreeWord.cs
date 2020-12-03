using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations.Schema;

namespace UET.EGarden.Study
{
    [Table("LesonTreeWord")]
    public class LesonTreeWord : FullAuditedEntity<long>, IEntity<long>
    {
        public long UserId { get; set; }
        public long BookId { get; set; }
        public long UnitId { get; set; }
        public long VocabularyId { get; set; }
    }
}
