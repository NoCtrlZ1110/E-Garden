using System.Collections.Generic;
using UET.EGarden.Auditing.Dto;
using UET.EGarden.Dto;

namespace UET.EGarden.Auditing.Exporting
{
    public interface IAuditLogListExcelExporter
    {
        FileDto ExportToFile(List<AuditLogListDto> auditLogListDtos);

        FileDto ExportToFile(List<EntityChangeListDto> entityChangeListDtos);
    }
}
