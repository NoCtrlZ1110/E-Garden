using System.Threading.Tasks;
using UET.EGarden.Security.Recaptcha;

namespace UET.EGarden.Test.Base.Web
{
    public class FakeRecaptchaValidator : IRecaptchaValidator
    {
        public Task ValidateAsync(string captchaResponse)
        {
            return Task.CompletedTask;
        }
    }
}
