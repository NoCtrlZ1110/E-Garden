using System.Threading.Tasks;
using Abp.Application.Services.Dto;
using UET.EGarden.MultiTenancy.Accounting.Dto;

namespace UET.EGarden.MultiTenancy.Accounting
{
    public interface IInvoiceAppService
    {
        Task<InvoiceDto> GetInvoiceInfo(EntityDto<long> input);

        Task CreateInvoice(CreateInvoiceDto input);
    }
}
