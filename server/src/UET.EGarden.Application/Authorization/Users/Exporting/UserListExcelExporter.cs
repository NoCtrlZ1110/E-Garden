﻿using System;
using System.Collections.Generic;
using System.Linq;
using Abp.Collections.Extensions;
using Abp.Runtime.Session;
using Abp.Timing.Timezone;
using UET.EGarden.Authorization.Users.Dto;
using UET.EGarden.DataExporting.Excel.NPOI;
using UET.EGarden.Dto;
using UET.EGarden.Storage;
using NPOI.SS.UserModel;

namespace UET.EGarden.Authorization.Users.Exporting
{
    public class UserListExcelExporter : NpoiExcelExporterBase, IUserListExcelExporter
    {
        private readonly ITimeZoneConverter _timeZoneConverter;
        private readonly IAbpSession _abpSession;

        public UserListExcelExporter(
            ITimeZoneConverter timeZoneConverter,
            IAbpSession abpSession,
            ITempFileCacheManager tempFileCacheManager)
            : base(tempFileCacheManager)
        {
            _timeZoneConverter = timeZoneConverter;
            _abpSession = abpSession;
        }

        public FileDto ExportToFile(List<UserListDto> userListDtos)
        {
            return CreateExcelPackage(
                "UserList.xlsx",
                excelPackage =>
                {
                    var sheet = excelPackage.CreateSheet(L("Users"));

                    AddHeader(
                        sheet,
                        L("Name"),
                        L("Surname"),
                        L("UserName"),
                        L("PhoneNumber"),
                        L("EmailAddress"),
                        L("EmailConfirm"),
                        L("Roles"),
                        L("Active"),
                        L("CreationTime")
                        );

                    AddObjects(
                        sheet, 2, userListDtos,
                        _ => _.Name,
                        _ => _.Surname,
                        _ => _.UserName,
                        _ => _.PhoneNumber,
                        _ => _.EmailAddress,
                        _ => _.IsEmailConfirmed,
                        _ => _.Roles.Select(r => r.RoleName).JoinAsString(", "),
                        _ => _.IsActive,
                        _ => _timeZoneConverter.Convert(_.CreationTime, _abpSession.TenantId, _abpSession.GetUserId())
                        );
                    
                    for (var i = 1; i <= userListDtos.Count; i++)
                    {
                        //Formatting cells
                        SetCellDataFormat(sheet.GetRow(i).Cells[8], "yyyy-mm-dd");
                    }
                    
                    for (var i = 0; i < 9; i++)
                    {
                        sheet.AutoSizeColumn(i);
                    }
                });
        }
    }
}
