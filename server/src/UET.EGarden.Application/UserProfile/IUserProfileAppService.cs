using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using UET.EGarden.UserProfile.Dto;

namespace UET.EGarden.UserProfile
{
    public interface IUserProfileAppService
    {
/*        Task EditProfileUser(UserProfileDto userProfile);
        Task<UserProfileDto> GetUserProfile();*/
        Task<UserAchievermentDto> GetUserAchieverment();
    }
}
