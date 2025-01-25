class Endpoints {
  static String login = '/v1/authorization/auth/token';
  static String logout = '/v1/authorization/auth/token';
  static String register = '/v1/authorization/auth/register';
  static String refresh = '/v1/authorization/auth/refreshtoken';
}

class NetworkSettings {
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
}
