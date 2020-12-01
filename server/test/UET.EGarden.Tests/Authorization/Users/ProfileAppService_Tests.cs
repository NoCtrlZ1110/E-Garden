﻿using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using UET.EGarden.Authorization.Users;
using UET.EGarden.Authorization.Users.Profile;
using UET.EGarden.Authorization.Users.Profile.Dto;
using UET.EGarden.Test.Base;
using Shouldly;
using Xunit;

namespace UET.EGarden.Tests.Authorization.Users
{
    // ReSharper disable once InconsistentNaming
    public class ProfileAppService_Tests : AppTestBase
    {
        private readonly IProfileAppService _profileAppService;

        public ProfileAppService_Tests()
        {
            _profileAppService = Resolve<IProfileAppService>();
        }

        [Fact]
        public async Task UpdateGoogleAuthenticatorKey_Test()
        {
            var currentUser = await GetCurrentUserAsync();

            //Assert
            currentUser.GoogleAuthenticatorKey.ShouldBeNull();

            //Act
            await _profileAppService.UpdateGoogleAuthenticatorKey();

            currentUser = await GetCurrentUserAsync();

            //Assert
            currentUser.GoogleAuthenticatorKey.ShouldNotBeNull();
        }

        [Fact]
        public async Task GetUserProfileForEdit_Test()
        {
            //Act
            var output = await _profileAppService.GetCurrentUserProfileForEdit();

            //Assert
            var currentUser = await GetCurrentUserAsync();
            output.Name.ShouldBe(currentUser.Name);
            output.Surname.ShouldBe(currentUser.Surname);
            output.EmailAddress.ShouldBe(currentUser.EmailAddress);
        }

        [Fact]
        public async Task UpdateUserProfileForEdit_Test()
        {
            //Arrange
            var currentUser = await GetCurrentUserAsync();

            //Act
            await _profileAppService.UpdateCurrentUserProfile(
                new CurrentUserProfileEditDto
                {
                    EmailAddress = "test1@test.net",
                    Name = "modified name",
                    Surname = "modified surname",
                    UserName = currentUser.UserName
                });

            //Assert
            currentUser = await GetCurrentUserAsync();
            currentUser.EmailAddress.ShouldBe("test1@test.net");
            currentUser.Name.ShouldBe("modified name");
            currentUser.Surname.ShouldBe("modified surname");
        }

        [Fact]
        public async Task ChangePassword_Test()
        {
            //Act
            await _profileAppService.ChangePassword(
                new ChangePasswordInput
                {
                    CurrentPassword = "123qwe",
                    NewPassword = "2mF9d8Ac!5"
                });

            //Assert
            var currentUser = await GetCurrentUserAsync();

            LocalIocManager
                .Resolve<IPasswordHasher<User>>()
                .VerifyHashedPassword(currentUser, currentUser.Password, "2mF9d8Ac!5")
                .ShouldBe(PasswordVerificationResult.Success);
        } 
    }
}
