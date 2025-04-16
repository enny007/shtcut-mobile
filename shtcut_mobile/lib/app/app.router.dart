// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i18;
import 'package:flutter/material.dart' as _i17;
import 'package:flutter/material.dart';
import 'package:shtcut_mobile/ui/views/all_post/all_post_view.dart' as _i15;
import 'package:shtcut_mobile/ui/views/calendar/calendar_view.dart' as _i8;
import 'package:shtcut_mobile/ui/views/connect_accounts/connect_accounts_view.dart'
    as _i6;
import 'package:shtcut_mobile/ui/views/content_preview/content_preview_view.dart'
    as _i14;
import 'package:shtcut_mobile/ui/views/create_post/create_post_content_view.dart'
    as _i12;
import 'package:shtcut_mobile/ui/views/create_post/create_post_view.dart'
    as _i11;
import 'package:shtcut_mobile/ui/views/home/home_view.dart' as _i7;
import 'package:shtcut_mobile/ui/views/live_broadcast/live_broadcast_view.dart'
    as _i10;
import 'package:shtcut_mobile/ui/views/media_library/media_library_view.dart'
    as _i16;
import 'package:shtcut_mobile/ui/views/onboarding/onboarding_view.dart' as _i3;
import 'package:shtcut_mobile/ui/views/recording/recording_view.dart' as _i9;
import 'package:shtcut_mobile/ui/views/sign_in/sign_in_view.dart' as _i5;
import 'package:shtcut_mobile/ui/views/sign_up/sign_up_view.dart' as _i4;
import 'package:shtcut_mobile/ui/views/startup/startup_view.dart' as _i2;
import 'package:shtcut_mobile/ui/views/unsplash/unsplash_view.dart' as _i13;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i19;

class Routes {
  static const startupView = '/startup-view';

  static const onboardingView = '/onboarding-view';

  static const signUpView = '/sign-up-view';

  static const signInView = '/sign-in-view';

  static const connectAccountsView = '/connect-accounts-view';

  static const homeView = '/home-view';

  static const calendarView = '/calendar-view';

  static const recordingView = '/recording-view';

  static const liveBroadcastView = '/live-broadcast-view';

  static const createPostView = '/create-post-view';

  static const createPostContentView = '/create-post-content-view';

  static const unsplashView = '/unsplash-view';

  static const contentPreviewView = '/content-preview-view';

  static const allPostView = '/all-post-view';

  static const mediaLibraryView = '/media-library-view';

  static const all = <String>{
    startupView,
    onboardingView,
    signUpView,
    signInView,
    connectAccountsView,
    homeView,
    calendarView,
    recordingView,
    liveBroadcastView,
    createPostView,
    createPostContentView,
    unsplashView,
    contentPreviewView,
    allPostView,
    mediaLibraryView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i3.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i4.SignUpView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i5.SignInView,
    ),
    _i1.RouteDef(
      Routes.connectAccountsView,
      page: _i6.ConnectAccountsView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i7.HomeView,
    ),
    _i1.RouteDef(
      Routes.calendarView,
      page: _i8.CalendarView,
    ),
    _i1.RouteDef(
      Routes.recordingView,
      page: _i9.RecordingView,
    ),
    _i1.RouteDef(
      Routes.liveBroadcastView,
      page: _i10.LiveBroadcastView,
    ),
    _i1.RouteDef(
      Routes.createPostView,
      page: _i11.CreatePostView,
    ),
    _i1.RouteDef(
      Routes.createPostContentView,
      page: _i12.CreatePostContentView,
    ),
    _i1.RouteDef(
      Routes.unsplashView,
      page: _i13.UnsplashView,
    ),
    _i1.RouteDef(
      Routes.contentPreviewView,
      page: _i14.ContentPreviewView,
    ),
    _i1.RouteDef(
      Routes.allPostView,
      page: _i15.AllPostView,
    ),
    _i1.RouteDef(
      Routes.mediaLibraryView,
      page: _i16.MediaLibraryView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i2.StartupView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i3.OnboardingView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i3.OnboardingView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i4.SignUpView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i4.SignUpView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i5.SignInView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i5.SignInView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i6.ConnectAccountsView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i6.ConnectAccountsView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i7.HomeView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i7.HomeView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i8.CalendarView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i8.CalendarView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i9.RecordingView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i9.RecordingView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i10.LiveBroadcastView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i10.LiveBroadcastView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i11.CreatePostView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i11.CreatePostView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i12.CreatePostContentView: (data) {
      final args = data.getArgs<CreatePostContentViewArguments>(
        orElse: () => const CreatePostContentViewArguments(),
      );
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i12.CreatePostContentView(
                key: args.key, isEditView: args.isEditView),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i13.UnsplashView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i13.UnsplashView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i14.ContentPreviewView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i14.ContentPreviewView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i15.AllPostView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i15.AllPostView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
    _i16.MediaLibraryView: (data) {
      return _i17.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const _i16.MediaLibraryView(),
        settings: data,
        transitionsBuilder: data.transition ?? _i1.TransitionsBuilders.fadeIn,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CreatePostContentViewArguments {
  const CreatePostContentViewArguments({
    this.key,
    this.isEditView = false,
  });

  final _i18.Key? key;

  final bool isEditView;

  @override
  String toString() {
    return '{"key": "$key", "isEditView": "$isEditView"}';
  }

  @override
  bool operator ==(covariant CreatePostContentViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isEditView == isEditView;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isEditView.hashCode;
  }
}

extension NavigatorStateExtension on _i19.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConnectAccountsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.connectAccountsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCalendarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.calendarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRecordingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.recordingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLiveBroadcastView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.liveBroadcastView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreatePostView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createPostView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreatePostContentView({
    _i18.Key? key,
    bool isEditView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createPostContentView,
        arguments:
            CreatePostContentViewArguments(key: key, isEditView: isEditView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUnsplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.unsplashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContentPreviewView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contentPreviewView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAllPostView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.allPostView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMediaLibraryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mediaLibraryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConnectAccountsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.connectAccountsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCalendarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.calendarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRecordingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.recordingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLiveBroadcastView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.liveBroadcastView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreatePostView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createPostView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreatePostContentView({
    _i18.Key? key,
    bool isEditView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createPostContentView,
        arguments:
            CreatePostContentViewArguments(key: key, isEditView: isEditView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUnsplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.unsplashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContentPreviewView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.contentPreviewView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAllPostView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.allPostView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMediaLibraryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mediaLibraryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
