using Abp.Domain.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UET.EGarden.UserProfile.Dto;

namespace UET.EGarden.UserProfile
{
    public class UserProfileAppService : EGardenAppServiceBase, IUserProfileAppService
    {
        private readonly IRepository<UserAchieverment, long> _userAchievermentRepo;

        public UserProfileAppService(IRepository<UserAchieverment, long> userAchievermentRepo)
        {
            _userAchievermentRepo = userAchievermentRepo;
        }

        public async Task<UserAchievermentDto> GetUserAchieverment()
        {
            var userAchiverment = await _userAchievermentRepo.GetAll().Where(u => u.UserId == AbpSession.UserId).FirstOrDefaultAsync();
            return ObjectMapper.Map<UserAchievermentDto>(userAchiverment);
        }
    }
}
