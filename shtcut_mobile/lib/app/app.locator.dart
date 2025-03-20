// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../core/api/auth/auth_impl.dart';
import '../core/network/dio_client.dart';
import '../core/service/auth_service.dart';
import '../core/service/bottom_bar_service.dart';
import '../core/service/local_storage_service.dart';
import '../core/service/media_service.dart';
import '../core/service/social_auth_service.dart';
import '../core/service/toast_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => BottomBarService());
  locator.registerLazySingleton(() => MediaService());
  locator.registerLazySingleton(() => SharedPreferencesService());
  locator.registerLazySingleton(() => DioClient.getInstance());
  locator.registerLazySingleton(() => ToastService());
  locator.registerLazySingleton(() => AuthImpl());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => SocialAuthService());
}
