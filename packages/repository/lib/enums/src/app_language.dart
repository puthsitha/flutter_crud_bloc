enum AppLanguage {
  en('en'),
  kh('kh'),
  zh('zh'),
  unknown('unknown');

  final String value;

  const AppLanguage(this.value);

  static AppLanguage fromJson(String? json) {
    switch (json) {
      case 'en':
        return AppLanguage.en;
      case 'kh':
        return AppLanguage.kh;
      case 'zh':
        return AppLanguage.zh;
      default:
        return AppLanguage.en;
    }
  }
}
