using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;
using System.ComponentModel.DataAnnotations.Schema;

namespace UET.EasyAccommod.Study
{
    [Table("Book")]
    public class Book : FullAuditedEntity<long>, IEntity<long>
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string BookColor { get; set; }
        public string BookImage { get; set; }
        public long Grade { get; set; }
        public long TotalWord { get; set; }
        public long TotalSentence { get; set; }
        public long TotalUnit { get; set; }
    }
}
