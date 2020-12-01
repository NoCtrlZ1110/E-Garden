using System.Threading.Tasks;

namespace UET.EGarden.Security.Recaptcha
{
    public interface IRecaptchaValidator
    {
        Task ValidateAsync(string captchaResponse);
    }
}