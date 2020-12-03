using System.ComponentModel.DataAnnotations;

namespace UET.EGarden.Users.Dto
{
    public class ChangeUserLanguageDto
    {
        [Required]
        public string LanguageName { get; set; }
    }
}