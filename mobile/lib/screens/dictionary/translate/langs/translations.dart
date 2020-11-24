class Translations {
  static final languages = <String>['English', 'Spanish', 'French', 'German', 'Italian', 'Russian', 'Vietnamese'];

  static String getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'French':
        return 'fr';
      case 'Italian':
        return 'it';
      case 'Russian':
        return 'ru';
      case 'Spanish':
        return 'es';
      case 'German':
        return 'de';
      case 'Vietnamese':
        return 'vi';
      default:
        return 'en';
    }
  }
}
