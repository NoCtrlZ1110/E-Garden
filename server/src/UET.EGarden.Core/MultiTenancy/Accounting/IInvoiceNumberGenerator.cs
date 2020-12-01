using System.Threading.Tasks;
using Abp.Dependency;

namespace UET.EGarden.MultiTenancy.Accounting
{
    public interface IInvoiceNumberGenerator : ITransientDependency
    {
        Task<string> GetNewInvoiceNumber();
    }
}