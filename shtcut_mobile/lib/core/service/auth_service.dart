import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/core/api/auth/auth_impl.dart';
import 'package:shtcut_mobile/core/base/base_service.dart';
import 'package:shtcut_mobile/core/base/base_data.dart';
import 'package:shtcut_mobile/core/models.dart/meta.dart';
import 'package:shtcut_mobile/core/models.dart/signed_in_user_model.dart';
import 'package:shtcut_mobile/core/models.dart/social_auth_type.dart';
import 'package:shtcut_mobile/core/models.dart/user.dart';
import 'package:shtcut_mobile/core/service/local_storage_service.dart';
import 'package:shtcut_mobile/core/service/social_auth_service.dart';

class AuthService extends BaseService {
  final _localStorage = locator<SharedPreferencesService>();
  final _authimpl = locator<AuthImpl>();
  final _socialAuthService = locator<SocialAuthService>();

  User? _currentUser;

  User? get currentUser => _currentUser;

  /// Signs up a new user with email and password
  Future<BaseData<User?>?> signUp({
    required String email,
    required String password,
  }) {
    return executeRequest(() async {
      final response = await _authimpl.signUp(
        email: email,
        password: password,
      );

      if (response != null && response.isSuccess) {
        _currentUser = response.data;
        _localStorage.saveToken(response.meta?.token ?? '');
      }

      return response;
    });
  }

  /// Verifies a user's account with the provided code
  Future<BaseData<User?>?> verifyUser({
    required String email,
    required String code,
  }) {
    return executeRequest(() async {
      final response = await _authimpl.verifyUser(
        email: email,
        code: code,
      );

      if (response != null && response.isSuccess) {
        _currentUser = response.data;
        _localStorage.saveToken(response.meta?.token ?? '');
      }

      return response;
    });
  }

  /// Sends a verification OTP to the user's email
  Future<BaseData?> sendOtp({
    required String email,
  }) {
    return executeRequest(() async {
      return await _authimpl.sendOtp(
        email: email,
      );
    });
  }

  /// Initiates password reset process for a user
  Future<BaseData?> passwordReset({
    required String email,
  }) {
    return executeRequest(() async {
      return await _authimpl.passwordReset(
        email: email,
      );
    });
  }

  /// Completes the password reset process with a new password
  Future<BaseData?> resetPassword({
    required String email,
    required String code,
    required String password,
  }) {
    return executeRequest(() async {
      return await _authimpl.resetPassword(
        email: email,
        code: code,
        password: password,
      );
    });
  }

  Future<BaseData<SocialAuthModel?>?> socialSignIn({
    required String socialType,
  }) async {
    return executeRequest(() async {
      String? token;

      // Get token based on social type
      if (socialType == 'google') {
        token = await _socialAuthService.getGoogleToken();
      }
      // else if (socialType == 'facebook') {
      //   token = await _socialAuthService.getFacebookToken();
      // }

      if (token == null) {
        return BaseData<SocialAuthModel?>(
          meta: Meta(
            success: false,
            message: 'Social token not obtained',
            statusCode: 400,
          ),
          data: null,
        );
      }

      // Call API with obtained token
      final response = await _authimpl.socialSignIn(
        accessToken: token,
        socialType: socialType,
      );

      if (response!.isSuccess) {
        _localStorage.saveToken(response.meta?.token ?? '');
      }

      return response;
    });
  }

  Future<BaseData<SignedInUserModel?>?> signIn({
    required String email,
    required String password,
  }) {
    return executeRequest(() async {
      final response = await _authimpl.signIn(
        email: email,
        password: password,
      );

      if (response != null && response.isSuccess) {
        // _currentUser = response.data;
        _localStorage.saveToken(response.meta?.token ?? '');
      }

      return response;
    });
  }
}
