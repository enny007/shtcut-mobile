import 'package:shtcut_mobile/core/api/auth/auth_api.dart';
import 'package:shtcut_mobile/core/base/base_data.dart';
import 'package:shtcut_mobile/core/models.dart/signed_in_user_model.dart';
import 'package:shtcut_mobile/core/models.dart/social_auth_type.dart';
import 'package:shtcut_mobile/core/models.dart/user.dart';
import 'package:shtcut_mobile/core/utils/endpoints.dart';

class AuthImpl extends AuthApi {
  @override
  Future<BaseData<User?>?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> res = await dioClient.post(
        Endpoints.signUp,
        data: {
          'email': email,
          'password': password,
          'firstName': 'dummy',
          'lastName': 'user',
        },
      );
      return BaseData.fromJson(
        res,
        dataConverter: (json) => User.fromJson(json),
      );
    } catch (e) {
      handleError(e);
    }
    return null;
  }

  @override
  Future<BaseData<User?>?> verifyUser({
    required String email,
    required String code,
  }) async {
    try {
      Map<String, dynamic> res = await dioClient.post(
        Endpoints.verifyUser,
        data: {
          'email': email,
          'verificationCode': code,
        },
      );

      return BaseData.fromJson(
        res,
        dataConverter: (json) => User.fromJson(json),
      );
    } catch (e) {
      handleError(e);
    }
    return null;
  }

  @override
  Future<BaseData?> sendOtp({
    required String email,
  }) async {
    try {
      Map<String, dynamic> res = await dioClient.post(
        Endpoints.sendVerification,
        data: {
          'email': email,
          'type': 'email',
        },
      );
      return BaseData.fromJson(
        res,
        dataConverter: (json) => json,
      );
    } catch (e) {
      handleError(e);
    }
    return BaseData();
  }

  @override
  Future<BaseData?> passwordReset({required String email}) async {
    try {
      Map<String, dynamic> res = await dioClient.post(
        Endpoints.passwordReset,
        data: {
          'email': email,
        },
      );
      return BaseData.fromJson(res);
    } catch (e) {
      handleError(e);
    }
    return BaseData();
  }

  @override
  Future<BaseData?> resetPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    try {
      Map<String, dynamic> res = await dioClient.post(
        Endpoints.resetPassword,
        data: {
          'email': email,
          'resetPasswordCode': code,
          'password': password,
        },
      );
      return BaseData.fromJson(res);
    } catch (e) {
      handleError(e);
    }
    return BaseData();
  }

  @override
  Future<BaseData<SocialAuthModel?>?> socialSignIn({
    required String accessToken,
    required String socialType,
  }) async {
    try {
      Map<String, dynamic> res = await dioClient.post(
        Endpoints.socialAuth,
        data: {
          'accessToken': accessToken,
          'socialType': socialType,
        },
      );

      return BaseData.fromJson(
        res,
        dataConverter: (json) => SocialAuthModel.fromJson(
          json as Map<String, dynamic>,
        ),
      );
    } catch (e) {
      handleError(e);
    }
    return null;
  }

  @override
  Future<BaseData<SignedInUserModel?>?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> res = await dioClient.post(
        Endpoints.signIn,
        data: {
          'email': email,
          'password': password,
        },
      );

      return BaseData.fromJson(
        res,
        dataConverter: (json) => SignedInUserModel.fromJson(json),
      );
    } catch (e) {
      handleError(e);
    }
    return BaseData();
  }
}
