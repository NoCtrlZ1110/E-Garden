﻿using UET.EGarden.Security;

namespace UET.EGarden.Configuration.Host.Dto
{
    public class SecuritySettingsEditDto
    {
        public bool AllowOneConcurrentLoginPerUser { get; set; }

        public bool UseDefaultPasswordComplexitySettings { get; set; }

        public PasswordComplexitySetting PasswordComplexity { get; set; }

        public PasswordComplexitySetting DefaultPasswordComplexity { get; set; }

        public UserLockOutSettingsEditDto UserLockOut { get; set; }

        public TwoFactorLoginSettingsEditDto TwoFactorLogin { get; set; }
    }
}