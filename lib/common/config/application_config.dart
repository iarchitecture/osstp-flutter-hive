import 'package:osstp_local_storage/osstp_local_storage.dart';

class ApplicationConfig {
  static final ApplicationConfig _instance = ApplicationConfig();
  static ApplicationConfig get instance => _instance;

  /// App 名称
  static String osstpProjectName = "HIVE";
  static String osstpBundleName = "HIVE";
  static String osstpBundleVersion = "1.0.0";

  /// 设置默认的语言显示
  static String defaultLanguage = "zh";

  /// 设置支持的语言类型
  static String supportLanguageEN = "en";

  initConfig() async {
    /// 本地存储初始化
    await OsstpLocalStorage.initConfig();
  }
}
