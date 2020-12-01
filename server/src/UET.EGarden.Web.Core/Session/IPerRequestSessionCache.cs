using System.Threading.Tasks;
using UET.EGarden.Sessions.Dto;

namespace UET.EGarden.Web.Session
{
    public interface IPerRequestSessionCache
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformationsAsync();
    }
}
