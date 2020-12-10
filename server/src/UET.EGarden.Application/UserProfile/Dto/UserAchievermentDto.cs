using Abp.Application.Services.Dto;

namespace UET.EGarden.UserProfile.Dto
{
    public class UserAchievermentDto : EntityDto<long>
    {
        public long UserId { get; set; }
        public long LearnWord { get; set; }
        public long LearnReview { get; set; }
        public long Level { get; set; }
    }
}
