using Xunit;

namespace UET.EGarden.Tests
{
    public sealed class MultiTenantTheoryAttribute : TheoryAttribute
    {
        private readonly bool _multiTenancyEnabled =EGardenConsts.MultiTenancyEnabled;
      
        public MultiTenantTheoryAttribute()
        {
            if (!_multiTenancyEnabled)
            {
                Skip = "MultiTenancy is disabled.";
            }
        }
    }
}