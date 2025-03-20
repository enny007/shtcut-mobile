import 'package:shtcut_mobile/core/base/base_api.dart';
import 'package:shtcut_mobile/core/base/base_data.dart';
import 'package:shtcut_mobile/core/models.dart/signed_in_user_model.dart';
import 'package:shtcut_mobile/core/models.dart/social_auth_type.dart';
import 'package:shtcut_mobile/core/models.dart/user.dart';

abstract class AuthApi extends BaseApi {
  Future<BaseData<User?>?> signUp({
    required String email,
    required String password,
  });
  Future<BaseData<SignedInUserModel?>?> signIn({
    required String email,
    required String password,
  });
  Future<BaseData?> sendOtp({
    required String email,
  });
  Future<BaseData?> passwordReset({
    required String email,
  });
  Future<BaseData?> resetPassword({
    required String email,
    required String code,
    required String password,
  });
  Future<BaseData<User?>?> verifyUser({
    required String email,
    required String code,
  });
  Future<BaseData<SocialAuthModel?>?> socialSignIn({
    required String accessToken,
    required String socialType,
  });
}
