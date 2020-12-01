﻿using System.Linq;
using System.Threading.Tasks;
using Abp.Application.Services.Dto;
using Abp.Authorization.Users;
using Abp.MultiTenancy;
using Abp.Zero.Configuration;
using Microsoft.EntityFrameworkCore;
using UET.EGarden.MultiTenancy;
using UET.EGarden.MultiTenancy.Dto;
using UET.EGarden.Notifications;
using UET.EGarden.Test.Base;
using Shouldly;

namespace UET.EGarden.Tests.MultiTenancy
{
    // ReSharper disable once InconsistentNaming
    public class TenantAppService_Tests : AppTestBase
    {
        private readonly ITenantAppService _tenantAppService;

        public TenantAppService_Tests()
        {
            LoginAsHostAdmin();

            _tenantAppService = Resolve<ITenantAppService>();
        }

        [MultiTenantFact]
        public async Task GetTenants_Test()
        {
            //Act
            var output = await _tenantAppService.GetTenants(new GetTenantsInput());

            //Assert
            output.TotalCount.ShouldBe(1);
            output.Items.Count.ShouldBe(1);
            output.Items[0].TenancyName.ShouldBe(AbpTenantBase.DefaultTenantName);
        }

        [MultiTenantFact]
        public async Task Create_Update_And_Delete_Tenant_Test()
        {
            //CREATE --------------------------------

            //Act
            await _tenantAppService.CreateTenant(
                new CreateTenantInput
                {
                    TenancyName = "testTenant",
                    Name = "Tenant for test purpose",
                    AdminEmailAddress = "admin@testtenant.com",
                    AdminPassword = "123qwe",
                    IsActive = true
                });

            //Assert
            var tenant = await GetTenantOrNullAsync("testTenant");
            tenant.ShouldNotBe(null);
            tenant.Name.ShouldBe("Tenant for test purpose");
            tenant.IsActive.ShouldBe(true);
            
            var tenantId = tenant.Id;

            await UsingDbContextAsync(tenantId, async context =>
            {
                //Check static roles
                var staticRoleNames = Resolve<IRoleManagementConfig>().StaticRoles.Where(r => r.Side == MultiTenancySides.Tenant).Select(role => role.RoleName).ToList();
                foreach (var staticRoleName in staticRoleNames)
                {
                    (await context.Roles.CountAsync(r => r.TenantId == tenantId && r.Name == staticRoleName)).ShouldBe(1);
                }

                //Check default admin user
                var adminUser = await context.Users.FirstOrDefaultAsync(u => u.TenantId == tenantId && u.UserName == AbpUserBase.AdminUserName);
                adminUser.ShouldNotBeNull();

                //Check notification registration
                (await context.NotificationSubscriptions.FirstOrDefaultAsync(ns => ns.UserId == adminUser.Id && ns.NotificationName == AppNotificationNames.NewUserRegistered)).ShouldNotBeNull();
            });

            //GET FOR EDIT -----------------------------

            //Act
            var editDto = await _tenantAppService.GetTenantForEdit(new EntityDto(tenant.Id));

            //Assert
            editDto.TenancyName.ShouldBe("testTenant");
            editDto.Name.ShouldBe("Tenant for test purpose");
            editDto.IsActive.ShouldBe(true);

            // UPDATE ----------------------------------

            editDto.Name = "edited tenant name";
            editDto.IsActive = false;
            await _tenantAppService.UpdateTenant(editDto);

            //Assert
            tenant = await GetTenantAsync("testTenant");
            tenant.Name.ShouldBe("edited tenant name");
            tenant.IsActive.ShouldBe(false);

            // DELETE ----------------------------------

            //Act
            await _tenantAppService.DeleteTenant(new EntityDto((await GetTenantAsync("testTenant")).Id));

            //Assert
            (await GetTenantOrNullAsync("testTenant")).IsDeleted.ShouldBe(true);
        }
    }
}
