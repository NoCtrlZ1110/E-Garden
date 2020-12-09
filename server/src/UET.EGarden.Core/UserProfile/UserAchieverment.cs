using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace UET.EGarden.UserProfile
{
    [Table("UserAchieverment")]
    public class UserAchieverment : FullAuditedEntity<long>, IEntity<long>
    {
        public long UserId { get; set; }
        public long LearnWord { get; set; }
        public long LearnReview { get; set; }
        public long Level { get; set; }
    }
}
