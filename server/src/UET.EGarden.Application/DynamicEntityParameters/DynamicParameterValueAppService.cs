using System.Collections.Generic;
using System.Threading.Tasks;
using Abp.Application.Services.Dto;
using Abp.DynamicEntityParameters;
using Microsoft.AspNetCore.Authorization;
using UET.EGarden.Authorization;
using UET.EGarden.DynamicEntityParameters.Dto;

namespace UET.EGarden.DynamicEntityParameters
{
    [Authorize(AppPermissions.Pages_Administration_DynamicParameterValue)]
    public class DynamicParameterValueAppService : EGardenAppServiceBase, IDynamicParameterValueAppService
    {
        private readonly IDynamicParameterValueManager _dynamicParameterValueManager;
        private readonly IDynamicParameterValueStore _dynamicParameterValueStore;

        public DynamicParameterValueAppService(IDynamicParameterValueManager dynamicParameterValueManager, IDynamicParameterValueStore dynamicParameterValueStore)
        {
            _dynamicParameterValueManager = dynamicParameterValueManager;
            _dynamicParameterValueStore = dynamicParameterValueStore;
        }

        public async Task<DynamicParameterValueDto> Get(int id)
        {
            var entity = await _dynamicParameterValueManager.GetAsync(id);
            return ObjectMapper.Map<DynamicParameterValueDto>(entity);
        }

        public async Task<ListResultDto<DynamicParameterValueDto>> GetAllValuesOfDynamicParameter(EntityDto input)
        {
            var entities = await _dynamicParameterValueStore.GetAllValuesOfDynamicParameterAsync(input.Id);
            return new ListResultDto<DynamicParameterValueDto>(
                ObjectMapper.Map<List<DynamicParameterValueDto>>(entities)
            );
        }

        [Authorize(AppPermissions.Pages_Administration_DynamicParameterValue_Create)]
        public async Task Add(DynamicParameterValueDto dto)
        {
            dto.TenantId = AbpSession.TenantId;
            await _dynamicParameterValueManager.AddAsync(ObjectMapper.Map<DynamicParameterValue>(dto));
        }

        [Authorize(AppPermissions.Pages_Administration_DynamicParameterValue_Edit)]
        public async Task Update(DynamicParameterValueDto dto)
        {
            dto.TenantId = AbpSession.TenantId;
            await _dynamicParameterValueManager.UpdateAsync(ObjectMapper.Map<DynamicParameterValue>(dto));
        }

        [Authorize(AppPermissions.Pages_Administration_DynamicParameterValue_Delete)]
        public async Task Delete(int id)
        {
            await _dynamicParameterValueManager.DeleteAsync(id);
        }
    }
}
