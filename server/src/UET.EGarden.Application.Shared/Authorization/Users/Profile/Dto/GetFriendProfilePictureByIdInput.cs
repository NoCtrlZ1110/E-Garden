﻿using System;

namespace UET.EGarden.Authorization.Users.Profile.Dto
{
    public class GetFriendProfilePictureByIdInput
    {
        public Guid? ProfilePictureId { get; set; }

        public long UserId { get; set; }

        public int? TenantId { get; set; }
    }
}
