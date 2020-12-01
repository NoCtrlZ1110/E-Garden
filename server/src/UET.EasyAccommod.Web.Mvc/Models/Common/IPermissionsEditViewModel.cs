using System.Collections.Generic;
using UET.EasyAccommod.Roles.Dto;

namespace UET.EasyAccommod.Web.Models.Common
{
    public interface IPermissionsEditViewModel
    {
        List<FlatPermissionDto> Permissions { get; set; }
    }
}