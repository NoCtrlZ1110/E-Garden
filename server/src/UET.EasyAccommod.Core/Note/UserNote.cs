using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;

namespace UET.EasyAccommod.Note
{
    [Table("UserNote")]
    public class UserNote : FullAuditedEntity<long>, IEntity<long>
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
