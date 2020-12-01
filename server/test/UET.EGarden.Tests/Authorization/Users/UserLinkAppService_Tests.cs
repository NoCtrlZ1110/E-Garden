﻿using System.Threading.Tasks;
using UET.EGarden.Authorization.Users;
using UET.EGarden.Authorization.Users.Dto;
using Shouldly;
using Xunit;

namespace UET.EGarden.Tests.Authorization.Users
{
    // ReSharper disable once InconsistentNaming
    public class UserLinkAppService_Tests : UserAppServiceTestBase
    {
        private readonly IUserLinkAppService _userLinkAppService;

        public UserLinkAppService_Tests()
        {
            _userLinkAppService = Resolve<UserLinkAppService>();
        }

        [Fact]
        public async Task GetLinkedUsers()
        {
            CreateTestUsers();

            var user = await GetUserByUserNameAsync("jnash");

            AbpSession.UserId = user.Id;

            var linkedUsers = await _userLinkAppService.GetLinkedUsers(
                new GetLinkedUsersInput
                {
                    MaxResultCount = 10,
                    SkipCount = 0
                }
            );

            linkedUsers.Items.Count.ShouldBe(0);
        }

        [Fact]
        public async Task GetRecentlyUsedLinkedUsers()
        {
            CreateTestUsers();

            var user = await GetUserByUserNameAsync("jnash");

            AbpSession.UserId = user.Id;

            var linkedUsers = await _userLinkAppService.GetRecentlyUsedLinkedUsers();

            linkedUsers.Items.Count.ShouldBe(0);
        }

        [Fact]
        public async Task LinkToUser()
        {
            CreateTestUsers();

            var user = await GetUserByUserNameAsync("jnash");

            AbpSession.UserId = user.Id;

            await _userLinkAppService.LinkToUser(
                new LinkToUserInput
                {
                    Password = "123qwe",
                    TenancyName = "Default",
                    UsernameOrEmailAddress = "adams_d@gmail.com"
                }
            );

            var linkedUsers = await _userLinkAppService.GetLinkedUsers(
                new GetLinkedUsersInput
                {
                    MaxResultCount = 10,
                    SkipCount = 0
                }
            );

            linkedUsers.Items.Count.ShouldBe(1);
        }
    }
}
