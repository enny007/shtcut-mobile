class Endpoints {
  static const String baseUrl = 'https://api-dev.shtcut.co/api/v1/';
  static const String xKey = 'LuminPayAppKey';
  static const int connectionTimeOut = 9000;
  static const int responseTimeOut = 9000;
  static const String signUp = 'acl/auth/sign-up';
  static const String sendVerification = 'acl/auth/send-verification';
  static const String verifyUser = 'acl/auth/verify-email';
  static const String passwordReset = 'acl/auth/password-reset';
  static const String resetPassword = 'acl/auth/reset-password';
  static const String socialAuth = 'acl/auth/social';
  static const String signIn = 'acl/auth/sign-in';
}
