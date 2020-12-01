using System.ComponentModel.DataAnnotations;

namespace UET.EGarden.Authorization.Users.Dto
{
    public class ChangeUserLanguageDto
    {
        [Required]
        public string LanguageName { get; set; }
    }
}
