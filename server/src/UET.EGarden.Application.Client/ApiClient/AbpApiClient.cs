using System;
using System.IO;
using System.Threading.Tasks;
using Abp.Configuration.Startup;
using Abp.Dependency;
using Abp.UI;
using Abp.Web.Models;
using Flurl.Http;
using Flurl.Http.Content;
using tmss.Extensions;

namespace tmss.ApiClient
{
    public class AbpApiClient : ISingletonDependency, IDisposable
    {
        private readonly IAccessTokenManager _accessTokenManager;
        private readonly IApplicationContext _applicationContext;
        private readonly IMultiTenancyConfig _multiTenancyConfig;
        private static FlurlClient _client;

        public static int? TimeoutSeconds { get; set; } = 30;

        public AbpApiClient(
            IAccessTokenManager accessTokenManager,
            IApplicationContext applicationContext,
            IMultiTenancyConfig multiTenancyConfig)
        {
            _accessTokenManager = accessTokenManager;
            _applicationContext = applicationContext;
            _multiTenancyConfig = multiTenancyConfig;
        }

        #region PostAsync<T>

        public async Task<T> PostAsync<T>(string endpoint)
        {
            return await PostAsync<T>(endpoint, null, null, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task<T> PostAnonymousAsync<T>(string endpoint)
        {
            return await PostAsync<T>(endpoint, null, null, null, true);
        }

        public async Task<T> PostAsync<T>(string endpoint, object inputDto)
        {
            return await PostAsync<T>(endpoint, inputDto, null, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task<T> PostAsync<T>(string endpoint, object inputDto, object queryParameters)
        {
            return await PostAsync<T>(endpoint, inputDto, queryParameters, _accessTokenManager.GetAccessToken(), true);
        }

        /// <summary>
        /// Makes POST request without authentication token.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="endpoint"></param>
        /// <param name="inputDto"></param>
        /// <returns></returns>
        public async Task<T> PostAnonymousAsync<T>(string endpoint, object inputDto)
        {
            return await PostAsync<T>(endpoint, inputDto, null, null, true);
        }

        public async Task<T> PostAsync<T>(string endpoint, object inputDto, object queryParameters, string accessToken, bool stripAjaxResponseWrapper)
        {
            var httpResponse = GetClient(accessToken)
                .Request(endpoint)
                .SetQueryParams(queryParameters)
                .PostJsonAsync(inputDto);

            if (stripAjaxResponseWrapper)
            {
                var response = await httpResponse.ReceiveJson<AjaxResponse<T>>();
                ValidateAbpResponse(response);
                return response.Result;
            }

            return await httpResponse.ReceiveJson<T>();
        }

        public async Task<T> PostMultipartAsync<T>(string endpoint, Action<CapturedMultipartContent> buildContent, bool stripAjaxResponseWrapper = true)
        {
            var httpResponse = GetClient(_accessTokenManager.GetAccessToken())
                .Request(endpoint)
                .PostMultipartAsync(buildContent);

            if (stripAjaxResponseWrapper)
            {
                var response = await httpResponse.ReceiveJson<AjaxResponse<T>>();
                ValidateAbpResponse(response);
                return response.Result;
            }

            return await httpResponse.ReceiveJson<T>();
        }

        public async Task<T> PostMultipartAsync<T>(string endpoint, Stream stream, string fileName, bool stripAjaxResponseWrapper = true)
        {
            var httpResponse = GetClient(_accessTokenManager.GetAccessToken())
                    .Request(endpoint)
                    .PostMultipartAsync(multiPartContent => multiPartContent.AddFile("file", stream, fileName));

            if (stripAjaxResponseWrapper)
            {
                var response = await httpResponse.ReceiveJson<AjaxResponse<T>>();
                ValidateAbpResponse(response);
                return response.Result;
            }

            return await httpResponse.ReceiveJson<T>();
        }

        public async Task<T> PostMultipartAsync<T>(string endpoint, string filePath, bool stripAjaxResponseWrapper = true)
        {
            var httpResponse = GetClient(_accessTokenManager.GetAccessToken())
                .Request(endpoint)
                .PostMultipartAsync(multiPartContent => multiPartContent.AddFile("file", filePath));

            if (stripAjaxResponseWrapper)
            {
                var response = await httpResponse.ReceiveJson<AjaxResponse<T>>();
                ValidateAbpResponse(response);
                return response.Result;
            }

            return await httpResponse.ReceiveJson<T>();
        }

        #endregion

        #region  PostAsync

        public async Task PostAsync(string endpoint)
        {
            await PostAsync(endpoint, null, null, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task PostAsync(string endpoint, object inputDto)
        {
            await PostAsync(endpoint, inputDto, null, _accessTokenManager.GetAccessToken(), true);
        }

        /// <summary>
        /// Makes POST request without authentication token.
        /// </summary>
        /// <param name="endpoint"></param>
        /// <param name="inputDto"></param>
        /// <returns></returns>
        public async Task PostAnonymousAsync(string endpoint, object inputDto)
        {
            await PostAsync(endpoint, inputDto, null, null, true);
        }

        public async Task PostAsync(string endpoint, object inputDto, object queryParameters)
        {
            await PostAsync(endpoint, inputDto, queryParameters, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task PostAsync(string endpoint, object inputDto, object queryParameters, string accessToken,
            bool stripAjaxResponseWrapper)
        {
            await GetClient(accessToken)
                  .Request(endpoint)
                  .SetQueryParams(queryParameters)
                  .PostJsonAsync(inputDto);
        }

        #endregion

        #region  GetAsync<T>

        public async Task<T> GetAsync<T>(string endpoint)
        {
            return await GetAsync<T>(endpoint, null);
        }

        /// <summary>
        /// Makes GET request without authentication token.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="endpoint"></param>
        /// <returns></returns>
        public async Task<T> GetAnonymousAsync<T>(string endpoint)
        {
            return await GetAsync<T>(endpoint, null, null, true);
        }

        public async Task<T> GetAsync<T>(string endpoint, object queryParameters)
        {
            return await GetAsync<T>(endpoint, queryParameters, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task<T> GetAsync<T>(string endpoint, object queryParameters, string accessToken, bool stripAjaxResponseWrapper)
        {
            var httpResponse = GetClient(accessToken)
                .Request(endpoint)
                .SetQueryParams(queryParameters);

            if (stripAjaxResponseWrapper)
            {
                var response = await httpResponse.GetJsonAsync<AjaxResponse<T>>();
                ValidateAbpResponse(response);
                return response.Result;
            }

            return await httpResponse.GetJsonAsync<T>();
        }

        #endregion

        #region  GetAsync

        public async Task GetAsync(string endpoint)
        {
            await GetAsync(endpoint, null);
        }

        public async Task GetAsync(string endpoint, object queryParameters)
        {
            await GetAsync(endpoint, queryParameters, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task GetAsync(string endpoint, object queryParameters, string accessToken, bool stripAjaxResponseWrapper)
        {
            await GetClient(accessToken)
             .Request(endpoint)
             .SetQueryParams(queryParameters)
             .GetAsync();
        }

        #endregion

        #region  GetStringAsync

        public async Task GetStringAsync(string endpoint)
        {
            await GetStringAsync(endpoint, null);
        }

        public async Task GetStringAsync(string endpoint, object queryParameters)
        {
            await GetStringAsync(endpoint, queryParameters, _accessTokenManager.GetAccessToken());
        }

        public async Task<string> GetStringAsync(string endpoint, object queryParameters, string accessToken)
        {
            return await GetClient(accessToken)
                    .Request(endpoint)
                    .SetQueryParams(queryParameters)
                    .GetStringAsync();

        }

        #endregion

        #region DeleteAsync

        public async Task DeleteAsync(string endpoint)
        {
            await DeleteAsync(endpoint, null, _accessTokenManager.GetAccessToken());
        }

        public async Task DeleteAsync(string endpoint, object queryParameters)
        {
            await DeleteAsync(endpoint, queryParameters, _accessTokenManager.GetAccessToken());
        }

        public async Task DeleteAsync(string endpoint, object queryParameters, string accessToken)
        {
            await GetClient(accessToken)
                    .Request(endpoint)
                    .SetQueryParams(queryParameters)
                    .DeleteAsync();
        }

        #endregion

        #region DeleteAsync<T>

        public async Task<T> DeleteAsync<T>(string endpoint)
        {
            return await DeleteAsync<T>(endpoint, null);
        }

        public async Task<T> DeleteAsync<T>(string endpoint, object queryParameters)
        {
            return await DeleteAsync<T>(endpoint, queryParameters, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task<T> DeleteAsync<T>(string endpoint, object queryParameters, string accessToken, bool stripAjaxResponseWrapper)
        {
            var httpResponse = GetClient(accessToken)
                .Request(endpoint)
                .SetQueryParams(queryParameters)
                .DeleteAsync();

            if (stripAjaxResponseWrapper)
            {
                var response = await httpResponse.ReceiveJson<AjaxResponse<T>>();
                ValidateAbpResponse(response);
                return response.Result;
            }

            return await httpResponse.ReceiveJson<T>();
        }

        #endregion

        #region PutAsync<T>

        public async Task<T> PutAsync<T>(string endpoint)
        {
            return await PutAsync<T>(endpoint, null, null, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task<T> PutAsync<T>(string endpoint, object inputDto)
        {
            return await PutAsync<T>(endpoint, inputDto, null, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task<T> PutAsync<T>(string endpoint, object inputDto, object queryParameters)
        {
            return await PutAsync<T>(endpoint, inputDto, queryParameters, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task<T> PutAsync<T>(string endpoint, object inputDto, object queryParameters, string accessToken, bool stripAjaxResponseWrapper)
        {
            var httpResponse = GetClient(accessToken)
                .Request(endpoint)
                .SetQueryParams(queryParameters)
                .PutJsonAsync(inputDto);

            if (stripAjaxResponseWrapper)
            {
                var response = await httpResponse.ReceiveJson<AjaxResponse<T>>();
                ValidateAbpResponse(response);
                return response.Result;
            }

            return await httpResponse.ReceiveJson<T>();
        }
        #endregion

        #region  PutAsync

        public async Task PutAsync(string endpoint)
        {
            await PutAsync(endpoint, null, null, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task PutAsync(string endpoint, object inputDto)
        {
            await PutAsync(endpoint, inputDto, null, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task PutAsync(string endpoint, object inputDto, object queryParameters)
        {
            await PutAsync(endpoint, inputDto, queryParameters, _accessTokenManager.GetAccessToken(), true);
        }

        public async Task PutAsync(string endpoint, object inputDto, object queryParameters, string accessToken,
            bool stripAjaxResponseWrapper)
        {
            await GetClient(accessToken)
                  .Request(endpoint)
                  .SetQueryParams(queryParameters)
                  .PutJsonAsync(inputDto);
        }

        #endregion

        public FlurlClient GetClient(string accessToken)
        {
            if (_client == null)
            {
                CreateClient();
            }

            AddHeaders(accessToken);
            return _client;
        }

        private static void CreateClient()
        {
            _client = new FlurlClient(ApiUrlConfig.BaseUrl);

            if (TimeoutSeconds.HasValue)
            {
                _client.WithTimeout(TimeoutSeconds.Value);
            }
        }

        private void AddHeaders(string accessToken)
        {
            _client.HttpClient.DefaultRequestHeaders.Clear();

            _client.WithHeader("Accept", "application/json");
            _client.WithHeader("User-Agent", tmssConsts.AbpApiClientUserAgent);
            /* Disabled due to https://github.com/paulcbetts/ModernHttpClient/issues/198#issuecomment-181263988
               _client.WithHeader("Accept-Encoding", "gzip,deflate");
            */

            if (_applicationContext.CurrentLanguage != null)
            {
                _client.WithHeader(".AspNetCore.Culture", "c=" + _applicationContext.CurrentLanguage.Name + "|uic=" + _applicationContext.CurrentLanguage.Name);
            }

            if (_applicationContext.CurrentTenant != null)
            {
                _client.WithHeader(_multiTenancyConfig.TenantIdResolveKey, _applicationContext.CurrentTenant.TenantId);
            }

            if (accessToken != null)
            {
                _client.WithOAuthBearerToken(accessToken);
            }
        }

        private static void ValidateAbpResponse(AjaxResponseBase response)
        {
            if (response == null)
            {
                return;
            }

            if (response.Success)
            {
                return;
            }

            if (response.Error == null)
            {
                return;
            }

            throw new UserFriendlyException(response.Error.GetConsolidatedMessage());
        }

        public void Dispose()
        {
            _client?.Dispose();
        }
    }
}