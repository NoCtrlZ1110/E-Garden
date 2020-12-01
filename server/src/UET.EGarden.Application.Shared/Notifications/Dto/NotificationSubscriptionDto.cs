﻿using System.ComponentModel.DataAnnotations;
using Abp.Notifications;

namespace UET.EGarden.Notifications.Dto
{
    public class NotificationSubscriptionDto
    {
        [Required]
        [MaxLength(NotificationInfo.MaxNotificationNameLength)]
        public string Name { get; set; }

        public bool IsSubscribed { get; set; }
    }
}