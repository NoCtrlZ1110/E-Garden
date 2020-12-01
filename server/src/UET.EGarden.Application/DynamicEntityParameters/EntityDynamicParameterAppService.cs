using System.Collections.Generic;
using System.Threading.Tasks;
using Abp.Application.Services.Dto;
using Abp.DynamicEntityParameters;
using Microsoft.AspNetCore.Authorization;
using UET.EGarden.Authorization;
using UET.EGarden.DynamicEntityParameters.Dto;
using UET.EGarden.EntityDynamicParameters;

namespace UET.EGarden.DynamicEntityParameters
{
    [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameters)]
    public class EntityDynamicParameterAppService : EGardenAppServiceBase, IEntityDynamicParameterAppService
    {
        private readonly IEntityDynamicParameterManager _entityDynamicParameterManager;

        public EntityDynamicParameterAppService(IEntityDynamicParameterManager entityDynamicParameterManager)
        {
            _entityDynamicParameterManager = entityDynamicParameterManager;
        }

        public async Task<EntityDynamicParameterDto> Get(int id)
        {
            var entity = await _entityDynamicParameterManager.GetAsync(id);
            return ObjectMapper.Map<EntityDynamicParameterDto>(entity);
        }

        public async Task<ListResultDto<EntityDynamicParameterDto>> GetAllParametersOfAnEntity(EntityDynamicParameterGetAllInput input)
        {
            var entities = await _entityDynamicParameterManager.GetAllAsync(input.EntityFullName);
            return new ListResultDto<EntityDynamicParameterDto>(
                ObjectMapper.Map<List<EntityDynamicParameterDto>>(entities)
            );
        }

        public async Task<ListResultDto<EntityDynamicParameterDto>> GetAll()
        {
            var entities = await _entityDynamicParameterManager.GetAllAsync();
            return new ListResultDto<EntityDynamicParameterDto>(
                ObjectMapper.Map<List<EntityDynamicParameterDto>>(entities)
            );
        }

        [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameters_Create)]
        public async Task Add(EntityDynamicParameterDto dto)
        {
            await _entityDynamicParameterManager.AddAsync(ObjectMapper.Map<EntityDynamicParameter>(dto));
        }

        [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameters_Edit)]
        public async Task Update(EntityDynamicParameterDto dto)
        {
            await _entityDynamicParameterManager.UpdateAsync(ObjectMapper.Map<EntityDynamicParameter>(dto));
        }

        [Authorize(AppPermissions.Pages_Administration_EntityDynamicParameters_Delete)]
        public async Task Delete(int id)
        {
            await _entityDynamicParameterManager.DeleteAsync(id);
        }
    }
}
