using System.Collections.Generic;
using UET.EGarden.Authorization.Users.Importing.Dto;
using UET.EGarden.Dto;

namespace UET.EGarden.Authorization.Users.Importing
{
    public interface IInvalidUserExporter
    {
        FileDto ExportToFile(List<ImportUserDto> userListDtos);
    }
}
