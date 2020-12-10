using Abp.Application.Services.Dto;

namespace UET.EGarden.UserProfile.Dto
{
    public class UserProfileDto : EntityDto<long>
    {
        public string Name { get; set; }
        public string School { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Gender { get; set; }
        public long Age { get; set; }
    }
}
