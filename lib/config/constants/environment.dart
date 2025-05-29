import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String backendApi = dotenv.env['BACKEND_API'] ?? 'No API found';
}