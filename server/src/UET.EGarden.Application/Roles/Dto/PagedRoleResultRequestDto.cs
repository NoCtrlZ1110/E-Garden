using Abp.Application.Services.Dto;

namespace UET.EGarden.Roles.Dto
{
    public class PagedRoleResultRequestDto : PagedResultRequestDto
    {
        public string Keyword { get; set; }
    }
}

