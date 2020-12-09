using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace UET.EGarden.UserProfile
{
    [Table("UserDetail")]
    public class UserDetail : FullAuditedEntity<long>, IEntity<long>
    {
        public string Name { get; set; }
        public string School { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Gender { get; set; }
        public long Age { get; set; }
    }
}
