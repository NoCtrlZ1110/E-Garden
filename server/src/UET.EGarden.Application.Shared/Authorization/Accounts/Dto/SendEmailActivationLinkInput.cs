using System.ComponentModel.DataAnnotations;

namespace UET.EGarden.Authorization.Accounts.Dto
{
    public class SendEmailActivationLinkInput
    {
        [Required]
        public string EmailAddress { get; set; }
    }
}