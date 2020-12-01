using Abp.Application.Services.Dto;

namespace UET.EasyAccommod.Roles.Dto
{
    public class PagedRoleResultRequestDto : PagedResultRequestDto
    {
        public string Keyword { get; set; }
    }
}

