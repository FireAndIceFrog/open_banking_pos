import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  static String get apiBaseUrl {
    final v = dotenv.env['API_BASE_URL'] ?? '';
    if (v.isEmpty) {
      throw StateError('Missing API_BASE_URL in .env');
    }
    return v;
  }

  static Uri api(String path) {
    final base = apiBaseUrl;
    final normalizedBase =
        base.endsWith('/') ? base.substring(0, base.length - 1) : base;
    final normalizedPath = path.startsWith('/') ? path.substring(1) : path;
    return Uri.parse('$normalizedBase/$normalizedPath');
  }
}
