using System.Collections.Generic;
using UET.EGarden.Authorization.Users.Importing.Dto;
using Abp.Dependency;

namespace UET.EGarden.Authorization.Users.Importing
{
    public interface IUserListExcelDataReader: ITransientDependency
    {
        List<ImportUserDto> GetUsersFromExcel(byte[] fileBytes);
    }
}
