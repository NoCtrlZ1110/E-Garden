using System.ComponentModel.DataAnnotations;

namespace UET.EGarden.Localization.Dto
{
    public class CreateOrUpdateLanguageInput
    {
        [Required]
        public ApplicationLanguageEditDto Language { get; set; }
    }
}