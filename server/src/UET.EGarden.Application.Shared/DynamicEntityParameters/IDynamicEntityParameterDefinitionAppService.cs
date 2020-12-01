using System.Collections.Generic;

namespace UET.EGarden.DynamicEntityParameters
{
    public interface IDynamicEntityParameterDefinitionAppService
    {
        List<string> GetAllAllowedInputTypeNames();

        List<string> GetAllEntities();
    }
}
