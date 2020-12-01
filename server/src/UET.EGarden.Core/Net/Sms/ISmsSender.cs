using System.Threading.Tasks;

namespace UET.EGarden.Net.Sms
{
    public interface ISmsSender
    {
        Task SendAsync(string number, string message);
    }
}