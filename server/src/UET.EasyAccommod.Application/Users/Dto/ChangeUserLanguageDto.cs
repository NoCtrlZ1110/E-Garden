using System.ComponentModel.DataAnnotations;

namespace UET.EasyAccommod.Users.Dto
{
    public class ChangeUserLanguageDto
    {
        [Required]
        public string LanguageName { get; set; }
    }
}