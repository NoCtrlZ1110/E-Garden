﻿using System.Collections.Generic;
using System.Linq;
using System.Text;
using Abp.Localization;
using Abp.Localization.Sources;
using UET.EGarden.Authorization.Users.Importing.Dto;
using UET.EGarden.DataExporting.Excel.NPOI;
using NPOI.SS.UserModel;

namespace UET.EGarden.Authorization.Users.Importing
{
    public class UserListExcelDataReader : NpoiExcelImporterBase<ImportUserDto>, IUserListExcelDataReader
    {
        private readonly ILocalizationSource _localizationSource;

        public UserListExcelDataReader(ILocalizationManager localizationManager)
        {
            _localizationSource = localizationManager.GetSource(EGardenConsts.LocalizationSourceName);
        }

        public List<ImportUserDto> GetUsersFromExcel(byte[] fileBytes)
        {
            return ProcessExcelFile(fileBytes, ProcessExcelRow);
        }

        private ImportUserDto ProcessExcelRow(ISheet worksheet, int row)
        {
            if (IsRowEmpty(worksheet, row))
            {
                return null;
            }

            var exceptionMessage = new StringBuilder();
            var user = new ImportUserDto();

            try
            {
                user.UserName = GetRequiredValueFromRowOrNull(worksheet, row, 0, nameof(user.UserName), exceptionMessage);
                user.Name = GetRequiredValueFromRowOrNull(worksheet, row, 1, nameof(user.Name), exceptionMessage);
                user.Surname = GetRequiredValueFromRowOrNull(worksheet, row, 2, nameof(user.Surname), exceptionMessage);
                user.EmailAddress = GetRequiredValueFromRowOrNull(worksheet, row, 3, nameof(user.EmailAddress), exceptionMessage);
                worksheet.GetRow(row).Cells[4].SetCellType(CellType.String);
                user.PhoneNumber = worksheet.GetRow(row).Cells[4]?.StringCellValue;
                user.Password = GetRequiredValueFromRowOrNull(worksheet, row, 5, nameof(user.Password), exceptionMessage);
                user.AssignedRoleNames = GetAssignedRoleNamesFromRow(worksheet, row, 6);
            }
            catch (System.Exception exception)
            {
                user.Exception = exception.Message;
            }

            return user;
        }

        private string GetRequiredValueFromRowOrNull(ISheet worksheet, int row, int column, string columnName, StringBuilder exceptionMessage)
        {
            var cellValue = worksheet.GetRow(row).Cells[column].StringCellValue;
            if (cellValue != null && !string.IsNullOrWhiteSpace(cellValue))
            {
                return cellValue;
            }

            exceptionMessage.Append(GetLocalizedExceptionMessagePart(columnName));
            return null;
        }

        private string[] GetAssignedRoleNamesFromRow(ISheet worksheet, int row, int column)
        {
            var cellValue = worksheet.GetRow(row).Cells[column].StringCellValue;
            if (cellValue == null || string.IsNullOrWhiteSpace(cellValue))
            {
                return new string[0];
            }

            return cellValue.ToString().Split(',').Where(s => !string.IsNullOrWhiteSpace(s)).Select(s => s.Trim()).ToArray();
        }

        private string GetLocalizedExceptionMessagePart(string parameter)
        {
            return _localizationSource.GetString("{0}IsInvalid", _localizationSource.GetString(parameter)) + "; ";
        }

        private bool IsRowEmpty(ISheet worksheet, int row)
        {
            var cell = worksheet.GetRow(row)?.Cells.FirstOrDefault();
            return cell == null || string.IsNullOrWhiteSpace(cell.StringCellValue);
        }
    }
}
