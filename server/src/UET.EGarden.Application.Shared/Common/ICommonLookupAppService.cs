using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using UET.EGarden.Common.Dto;
using UET.EGarden.Editions.Dto;

namespace UET.EGarden.Common
{
    public interface ICommonLookupAppService : IApplicationService
    {
        Task<ListResultDto<SubscribableEditionComboboxItemDto>> GetEditionsForCombobox(bool onlyFreeItems = false);

        Task<PagedResultDto<NameValueDto>> FindUsers(FindUsersInput input);

        GetDefaultEditionNameOutput GetDefaultEditionName();
    }
}