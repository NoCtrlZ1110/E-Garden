using Abp.Configuration.Startup;
using Abp.Localization.Dictionaries;
using Abp.Localization.Dictionaries.Xml;
using Abp.Reflection.Extensions;

namespace UET.EasyAccommod.Localization
{
    public static class EasyAccommodLocalizationConfigurer
    {
        public static void Configure(ILocalizationConfiguration localizationConfiguration)
        {
            localizationConfiguration.Sources.Add(
                new DictionaryBasedLocalizationSource(EasyAccommodConsts.LocalizationSourceName,
                    new XmlEmbeddedFileLocalizationDictionaryProvider(
                        typeof(EasyAccommodLocalizationConfigurer).GetAssembly(),
                        "UET.EasyAccommod.Localization.SourceFiles"
                    )
                )
            );
        }
    }
}
