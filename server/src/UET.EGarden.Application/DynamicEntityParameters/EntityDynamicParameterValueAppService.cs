using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Application.Services.Dto;
using Abp.Collections.Extensions;
using Abp.DynamicEntityParameters;
using Microsoft.AspNetCore.Authorization;
using UET.EGarden.Authorization;
using UET.EGarden.DynamicEntityParameters.Dto;
using UET.EGarden.EntityDynamicParameterValues.Dto;

namespace UET.EGarden.DynamicEntityParameters
{
    [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameterValue)]
    public class EntityDynamicParameterValueAppService : EGardenAppServiceBase, IEntityDynamicParameterValueAppService
    {
        private readonly IEntityDynamicParameterValueManager _entityDynamicParameterValueManager;
        private readonly IDynamicParameterValueManager _dynamicParameterValueManager;
        private readonly IEntityDynamicParameterManager _entityDynamicParameterManager;
        private readonly IDynamicEntityParameterDefinitionManager _dynamicEntityParameterDefinitionManager;

        public EntityDynamicParameterValueAppService(
            IEntityDynamicParameterValueManager entityDynamicParameterValueManager,
            IDynamicParameterValueManager dynamicParameterValueManager,
            IEntityDynamicParameterManager entityDynamicParameterManager,
            IDynamicEntityParameterDefinitionManager dynamicEntityParameterDefinitionManager)
        {
            _entityDynamicParameterValueManager = entityDynamicParameterValueManager;
            _dynamicParameterValueManager = dynamicParameterValueManager;
            _entityDynamicParameterManager = entityDynamicParameterManager;
            _dynamicEntityParameterDefinitionManager = dynamicEntityParameterDefinitionManager;
        }

        public async Task<EntityDynamicParameterValueDto> Get(int id)
        {
            var entity = await _entityDynamicParameterValueManager.GetAsync(id);
            return ObjectMapper.Map<EntityDynamicParameterValueDto>(entity);
        }

        public async Task<ListResultDto<EntityDynamicParameterValueDto>> GetAll(GetAllInput input)
        {
            var entities = await _entityDynamicParameterValueManager.GetValuesAsync(input.ParameterId, input.EntityId);
            return new ListResultDto<EntityDynamicParameterValueDto>(
                ObjectMapper.Map<List<EntityDynamicParameterValueDto>>(entities)
            );
        }

        [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameterValue_Create)]
        public async Task Add(EntityDynamicParameterValueDto input)
        {
            input.TenantId = AbpSession.TenantId;
            await _entityDynamicParameterValueManager.AddAsync(ObjectMapper.Map<EntityDynamicParameterValue>(input));
        }

        [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameterValue_Edit)]
        public async Task Update(EntityDynamicParameterValueDto input)
        {
            input.TenantId = AbpSession.TenantId;
            await _entityDynamicParameterValueManager.UpdateAsync(ObjectMapper.Map<EntityDynamicParameterValue>(input));
        }

        [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameterValue_Delete)]
        public async Task Delete(int id)
        {
            await _entityDynamicParameterValueManager.DeleteAsync(id);
        }

        public async Task<GetAllEntityDynamicParameterValuesOutput> GetAllEntityDynamicParameterValues(GetAllEntityDynamicParameterValuesInput input)
        {
            var localCacheOfGetAllValuesOfDynamicParameter = new Dictionary<int, List<string>>();

            List<string> GetAllValuesInputTypeHas(int dynamicParameterId)
            {
                if (!localCacheOfGetAllValuesOfDynamicParameter.ContainsKey(dynamicParameterId))
                {
                    localCacheOfGetAllValuesOfDynamicParameter[dynamicParameterId] = _dynamicParameterValueManager
                        .GetAllValuesOfDynamicParameter(dynamicParameterId)
                        .Select(x => x.Value).ToList();
                }

                return localCacheOfGetAllValuesOfDynamicParameter[dynamicParameterId];
            }

            var output = new GetAllEntityDynamicParameterValuesOutput();

            var entityDynamicParameters = await _entityDynamicParameterManager.GetAllAsync(input.EntityFullName);

            var entityDynamicParameterIdAndValuesDictionary = (await _entityDynamicParameterValueManager.GetValuesAsync(input.EntityFullName, input.EntityId))
                .GroupBy(value => value.EntityDynamicParameterId)
                .ToDictionary(group => group.Key, items => items.ToList());


            foreach (var entityDynamicParameter in entityDynamicParameters)
            {
                var outputItem = new GetAllEntityDynamicParameterValuesOutputItem
                {
                    EntityDynamicParameterId = entityDynamicParameter.Id,
                    InputType = _dynamicEntityParameterDefinitionManager.GetOrNullAllowedInputType(entityDynamicParameter.DynamicParameter.InputType),
                    ParameterName = entityDynamicParameter.DynamicParameter.ParameterName,
                    AllValuesInputTypeHas = GetAllValuesInputTypeHas(entityDynamicParameter.DynamicParameter.Id),
                    SelectedValues = entityDynamicParameterIdAndValuesDictionary.ContainsKey(entityDynamicParameter.Id)
                        ? entityDynamicParameterIdAndValuesDictionary[entityDynamicParameter.Id].Select(value => value.Value).ToList()
                        : new List<string>()
                };

                output.Items.Add(outputItem);
            }

            return output;
        }

        [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameterValue_Create)]
        [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameterValue_Edit)]
        public async Task InsertOrUpdateAllValues(InsertOrUpdateAllValuesInput input)
        {
            if (input.Items.IsNullOrEmpty())
            {
                return;
            }

            foreach (var item in input.Items)
            {
                await _entityDynamicParameterValueManager.CleanValuesAsync(item.EntityDynamicParameterId, item.EntityId);

                foreach (var newValue in item.Values)
                {
                    await Add(new EntityDynamicParameterValueDto
                    {
                        EntityDynamicParameterId = item.EntityDynamicParameterId,
                        EntityId = item.EntityId,
                        Value = newValue,
                        TenantId = AbpSession.TenantId
                    });
                }
            }
        }

        [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameterValue_Delete)]
        public async Task CleanValues(CleanValuesInput input)
        {
            await _entityDynamicParameterValueManager.CleanValuesAsync(input.EntityDynamicParameterId, input.EntityId);
        }
    }
}
