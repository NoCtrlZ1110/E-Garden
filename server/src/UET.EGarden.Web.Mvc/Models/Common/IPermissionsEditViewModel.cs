using System.Collections.Generic;
using UET.EGarden.Roles.Dto;

namespace UET.EGarden.Web.Models.Common
{
    public interface IPermissionsEditViewModel
    {
        List<FlatPermissionDto> Permissions { get; set; }
    }
}