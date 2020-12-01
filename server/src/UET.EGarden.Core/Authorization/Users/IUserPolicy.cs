﻿using System.Threading.Tasks;
using Abp.Domain.Policies;

namespace UET.EGarden.Authorization.Users
{
    public interface IUserPolicy : IPolicy
    {
        Task CheckMaxUserCountAsync(int tenantId);
    }
}
