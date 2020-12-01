using System;
using System.Threading.Tasks;
using tmss.Authorization.Users.Dto;
using tmss.Authorization.Users.Profile.Dto;

namespace tmss.Authorization.Users.Profile
{
    public class ProxyProfileAppService : ProxyAppServiceBase, IProfileAppService
    {
        public async Task<CurrentUserProfileEditDto> GetCurrentUserProfileForEdit()
        {
            return await ApiClient.GetAsync<CurrentUserProfileEditDto>(GetEndpoint(nameof(GetCurrentUserProfileForEdit)));
        }

        public async Task UpdateCurrentUserProfile(CurrentUserProfileEditDto input)
        {
            await ApiClient.PutAsync(GetEndpoint(nameof(UpdateCurrentUserProfile)), input);
        }

        public async Task ChangePassword(ChangePasswordInput input)
        {
            await ApiClient.PostAsync(GetEndpoint(nameof(ChangePassword)), input);
        }

        public async Task UpdateProfilePicture(UpdateProfilePictureInput input)
        {
            await ApiClient.PutAsync(GetEndpoint(nameof(UpdateProfilePicture)), input);
        }

        public async Task<GetPasswordComplexitySettingOutput> GetPasswordComplexitySetting()
        {
            return await ApiClient.GetAsync<GetPasswordComplexitySettingOutput>(GetEndpoint(nameof(GetPasswordComplexitySetting)));
        }

        public async Task<GetProfilePictureOutput> GetProfilePicture()
        {
            return await ApiClient.GetAsync<GetProfilePictureOutput>(GetEndpoint(nameof(GetProfilePicture)));
        }

        public async Task<GetProfilePictureOutput> GetProfilePictureById(Guid profilePictureId)
        {
            return await ApiClient.GetAsync<GetProfilePictureOutput>(GetEndpoint(nameof(GetProfilePictureById)),
                new { profilePictureId = profilePictureId });
        }

        public async Task<GetProfilePictureOutput> GetFriendProfilePictureById(GetFriendProfilePictureByIdInput input)
        {
            return await ApiClient.GetAsync<GetProfilePictureOutput>(GetEndpoint(nameof(GetFriendProfilePictureById)), input);
        }

        public async Task ChangeLanguage(ChangeUserLanguageDto input)
        {
            await ApiClient.PostAsync(GetEndpoint(nameof(ChangeLanguage)), input);
        }

        public async Task<UpdateGoogleAuthenticatorKeyOutput> UpdateGoogleAuthenticatorKey()
        {
            return await ApiClient.PutAsync<UpdateGoogleAuthenticatorKeyOutput>(GetEndpoint(nameof(UpdateGoogleAuthenticatorKey)));
        }

        public async Task SendVerificationSms(SendVerificationSmsInputDto input)
        {
            await ApiClient.PostAsync(GetEndpoint(nameof(SendVerificationSms)), input);
        }

        public async Task VerifySmsCode(VerifySmsCodeInputDto input)
        {
            await ApiClient.PostAsync(GetEndpoint(nameof(VerifySmsCode)));
        }

        public async Task PrepareCollectedData()
        {
            await ApiClient.PostAsync(GetEndpoint(nameof(PrepareCollectedData)));
        }
    }
}