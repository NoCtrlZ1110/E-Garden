using Abp.Domain.Uow;
using Abp.EntityFrameworkCore;
using Abp.MultiTenancy;
using Abp.Zero.EntityFrameworkCore;

namespace UET.EGarden.EntityFrameworkCore
{
    public class AbpZeroDbMigrator : AbpZeroDbMigrator<EGardenDbContext>
    {
        public AbpZeroDbMigrator(
            IUnitOfWorkManager unitOfWorkManager,
            IDbPerTenantConnectionStringResolver connectionStringResolver,
            IDbContextResolver dbContextResolver) :
            base(
                unitOfWorkManager,
                connectionStringResolver,
                dbContextResolver)
        {

        }
    }
}
