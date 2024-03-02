enum Environment { dev, prod }

abstract class AppEnvironment {
  static late String baseApiUrl;
  static late String title;
  static late Environment _environment;
  static Environment get environment => _environment;
  static setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.dev:
        {
          baseApiUrl = 'https://api-dev.com/';
          title = 'musicapp dev';
          break;
        }

      case Environment.prod:
        {
          baseApiUrl = 'https://api-prod.com/';
          title = 'musicapp prod';
          break;
        }
    }
  }
}
