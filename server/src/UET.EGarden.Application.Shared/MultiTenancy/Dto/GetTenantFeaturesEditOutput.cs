using System.Collections.Generic;
using Abp.Application.Services.Dto;
using UET.EGarden.Editions.Dto;

namespace UET.EGarden.MultiTenancy.Dto
{
    public class GetTenantFeaturesEditOutput
    {
        public List<NameValueDto> FeatureValues { get; set; }

        public List<FlatFeatureDto> Features { get; set; }
    }
}