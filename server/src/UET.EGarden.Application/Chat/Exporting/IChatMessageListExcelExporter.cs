using System.Collections.Generic;
using Abp;
using UET.EGarden.Chat.Dto;
using UET.EGarden.Dto;

namespace UET.EGarden.Chat.Exporting
{
    public interface IChatMessageListExcelExporter
    {
        FileDto ExportToFile(UserIdentifier user, List<ChatMessageExportDto> messages);
    }
}
