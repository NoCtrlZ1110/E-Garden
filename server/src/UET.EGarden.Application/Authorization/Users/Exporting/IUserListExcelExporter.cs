using System.Collections.Generic;
using UET.EGarden.Authorization.Users.Dto;
using UET.EGarden.Dto;

namespace UET.EGarden.Authorization.Users.Exporting
{
    public interface IUserListExcelExporter
    {
        FileDto ExportToFile(List<UserListDto> userListDtos);
    }
}