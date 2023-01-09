class Environments {
  static const String PRODUCTION = 'prod';
  static const String QAS = 'QAS';
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

///used for assets envi
class AssetsEnv{
  ///logo assets;
  static String APPSLOGO = 'assets/logos/apps_logo.png';

  ///splash backgrounds
  static String SPLASHBACKGROUND = 'assets/backgrounds/splash_background.jpg';
}



class ConfigEnvironments {
  static const String _currentEnvironments = Environments.DEV;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL,
      'url': 'http://localhost:8080/api/',
    },
    {
      'env': Environments.DEV,
      'url': 'https://api.themoviedb.org/3/',
    },
    {
      'env': Environments.QAS,
      'url': '',
    },
    {
      'env': Environments.PRODUCTION,
      'url': 'https://api.themoviedb.org/3/',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }

}
