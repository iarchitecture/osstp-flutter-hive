import 'package:osstp_local_storage/osstp_local_storage.dart';
import 'package:osstp_network/osstp_network.dart';

class ApplicationConfig {
  static final ApplicationConfig _instance = ApplicationConfig();
  static ApplicationConfig get instance => _instance;

  /// App Name
  static String osstpProjectName = "HIVE";
  static String osstpBundleName = "HIVE";
  static String osstpBundleVersion = "1.0.0";

  ///
  static String defaultLanguage = "zh";
  static String supportLanguageEN = "en";

  initConfig() async {
    await OsstpLocalStorage.initConfig();
    networkConfig();
  }

  networkConfig() {
    OsstpNetworkConfig.instance.config(
        baseUrl: "http://api.tianapi.com",
        otherParameter: {'key': '8d6be0edba1b9edc4ed11353ce494948', 'num': 10},
        loggerLevel: OsstpNetworkLogLevel.headers);
  }
}
