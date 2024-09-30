import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> loadEnv(String env) async {
    await dotenv.load(fileName: 'variable_app.env');
  }

  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
}
