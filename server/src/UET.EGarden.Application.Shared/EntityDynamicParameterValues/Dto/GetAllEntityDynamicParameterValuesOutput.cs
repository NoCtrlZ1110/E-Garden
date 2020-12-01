using System.Collections.Generic;
using Abp.UI.Inputs;

namespace UET.EGarden.EntityDynamicParameterValues.Dto
{
    public class GetAllEntityDynamicParameterValuesOutput
    {
        public List<GetAllEntityDynamicParameterValuesOutputItem> Items { get; set; }

        public GetAllEntityDynamicParameterValuesOutput()
        {
            Items = new List<GetAllEntityDynamicParameterValuesOutputItem>();
        }
    }

    public class GetAllEntityDynamicParameterValuesOutputItem
    {
        public int EntityDynamicParameterId { get; set; }

        public string ParameterName { get; set; }

        public IInputType InputType { get; set; }

        public List<string> SelectedValues { get; set; }

        public List<string> AllValuesInputTypeHas { get; set; }
    }
}
