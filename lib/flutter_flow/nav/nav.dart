import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : HomePageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: 'registerSchool',
          path: '/registerSchool',
          builder: (context, params) => RegisterSchoolWidget(
            role: params.getParam('role', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'Main',
          path: '/main',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'Main') : MainWidget(),
        ),
        FFRoute(
          name: 'ProfileInfo',
          path: '/profileInfo',
          builder: (context, params) => ProfileInfoWidget(),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'EditProfile')
              : EditProfileWidget(),
        ),
        FFRoute(
          name: 'ChooseRole',
          path: '/chooseRole',
          builder: (context, params) => ChooseRoleWidget(),
        ),
        FFRoute(
          name: 'payPage',
          path: '/payPage',
          builder: (context, params) => PayPageWidget(
            sum: params.getParam('sum', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'TutorsN',
          path: '/tutorsN',
          builder: (context, params) => TutorsNWidget(),
        ),
        FFRoute(
          name: 'quizPage',
          path: '/quizPage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'quizPage')
              : QuizPageWidget(),
        ),
        FFRoute(
          name: 'create_Quiz',
          path: '/createQuiz',
          builder: (context, params) => CreateQuizWidget(),
        ),
        FFRoute(
          name: 'editQuestion',
          path: '/editQuestion',
          asyncParams: {
            'questionRef':
                getDoc(['quizzes', 'questions'], QuestionsRecord.fromSnapshot),
          },
          builder: (context, params) => EditQuestionWidget(
            questionRef: params.getParam('questionRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'createQuestion',
          path: '/createQuestion',
          asyncParams: {
            'quizRef': getDoc(['quizzes'], QuizzesRecord.fromSnapshot),
          },
          builder: (context, params) => CreateQuestionWidget(
            quizRef: params.getParam('quizRef', ParamType.Document),
            index: params.getParam('index', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'quiz_details',
          path: '/quizDetails',
          asyncParams: {
            'quizRef': getDoc(['quizzes'], QuizzesRecord.fromSnapshot),
          },
          builder: (context, params) => QuizDetailsWidget(
            quizRef: params.getParam('quizRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'quiz_QuestionDetails',
          path: '/quizQuestionDetails',
          asyncParams: {
            'quizRef': getDoc(['quizzes'], QuizzesRecord.fromSnapshot),
            'quizResult': getDoc(['quizResult'], QuizResultRecord.fromSnapshot),
          },
          builder: (context, params) => QuizQuestionDetailsWidget(
            quizRef: params.getParam('quizRef', ParamType.Document),
            quizResult: params.getParam('quizResult', ParamType.Document),
            index: params.getParam('index', ParamType.int),
            score: params.getParam('score', ParamType.int),
            timer: params.getParam('timer', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'quizCompleteSummary',
          path: '/quizCompleteSummary',
          asyncParams: {
            'quizRef': getDoc(['quizzes'], QuizzesRecord.fromSnapshot),
          },
          builder: (context, params) => QuizCompleteSummaryWidget(
            quizRef: params.getParam('quizRef', ParamType.Document),
            totalPoints: params.getParam('totalPoints', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Balance',
          path: '/balance',
          requireAuth: true,
          builder: (context, params) => BalanceWidget(
            price: params.getParam('price', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'MFeedBack',
          path: '/mFeedBack',
          builder: (context, params) => MFeedBackWidget(),
        ),
        FFRoute(
          name: 'aboarStudy',
          path: '/aboarStudy',
          builder: (context, params) => AboarStudyWidget(),
        ),
        FFRoute(
          name: 'abroadWork',
          path: '/abroadWork',
          builder: (context, params) => AbroadWorkWidget(),
        ),
        FFRoute(
          name: 'onlineStudy',
          path: '/onlineStudy',
          builder: (context, params) => OnlineStudyWidget(),
        ),
        FFRoute(
          name: 'promotionsN',
          path: '/promotionsN',
          builder: (context, params) => PromotionsNWidget(),
        ),
        FFRoute(
          name: 'ratings',
          path: '/ratings',
          builder: (context, params) => RatingsWidget(
            quizRef: params.getParam(
                'quizRef', ParamType.DocumentReference, false, ['quizzes']),
          ),
        ),
        FFRoute(
          name: 'quizPageRatings',
          path: '/quizPageRatings',
          builder: (context, params) => QuizPageRatingsWidget(),
        ),
        FFRoute(
          name: 'TournirsList',
          path: '/tournirsList',
          builder: (context, params) => TournirsListWidget(),
        ),
        FFRoute(
          name: 'tournirConfirm',
          path: '/tournirConfirm',
          builder: (context, params) => TournirConfirmWidget(
            tournirRef: params.getParam('tournirRef',
                ParamType.DocumentReference, false, ['tournaments']),
          ),
        ),
        FFRoute(
          name: 'create_Tournament',
          path: '/createTournament',
          builder: (context, params) => CreateTournamentWidget(),
        ),
        FFRoute(
          name: 'News',
          path: '/news',
          builder: (context, params) => NewsWidget(),
        ),
        FFRoute(
          name: 'Admin',
          path: '/Admin',
          requireAuth: true,
          builder: (context, params) => AdminWidget(),
        ),
        FFRoute(
          name: 'adminsOlimp',
          path: '/adminsOlimp',
          builder: (context, params) => AdminsOlimpWidget(),
        ),
        FFRoute(
          name: 'AdminPromotions',
          path: '/adminPromotions',
          asyncParams: {
            'promRef': getDoc(['promotions'], PromotionsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminPromotionsWidget(
            promRef: params.getParam('promRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AdminNews',
          path: '/adminNews',
          asyncParams: {
            'newsRef': getDoc(['news'], NewsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminNewsWidget(
            newsRef: params.getParam('newsRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AdminCourses',
          path: '/adminCourses',
          asyncParams: {
            'courseRef': getDoc(['courses'], CoursesRecord.fromSnapshot),
          },
          builder: (context, params) => AdminCoursesWidget(
            courseRef: params.getParam('courseRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AdminTutors',
          path: '/adminTutors',
          asyncParams: {
            'tutorRef': getDoc(['tutors'], TutorsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminTutorsWidget(
            tutorRef: params.getParam('tutorRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Courses',
          path: '/courses',
          builder: (context, params) => CoursesWidget(),
        ),
        FFRoute(
          name: 'AdminAbroadStudy',
          path: '/adminAbroadStudy',
          asyncParams: {
            'abroadStudyRef':
                getDoc(['study_abroad'], StudyAbroadRecord.fromSnapshot),
          },
          builder: (context, params) => AdminAbroadStudyWidget(
            abroadStudyRef:
                params.getParam('abroadStudyRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AdminAbroadWork',
          path: '/adminAbroadWork',
          asyncParams: {
            'abroadWorkRef':
                getDoc(['work_abroad'], WorkAbroadRecord.fromSnapshot),
          },
          builder: (context, params) => AdminAbroadWorkWidget(
            abroadWorkRef: params.getParam('abroadWorkRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AdminOnlineStudy',
          path: '/adminOnlineStudy',
          asyncParams: {
            'onlineStudyRef':
                getDoc(['online_study'], OnlineStudyRecord.fromSnapshot),
          },
          builder: (context, params) => AdminOnlineStudyWidget(
            onlineStudyRef:
                params.getParam('onlineStudyRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'buyQuiz',
          path: '/buyQuiz',
          asyncParams: {
            'quizRef': getDoc(['quizzes'], QuizzesRecord.fromSnapshot),
          },
          builder: (context, params) => BuyQuizWidget(
            quizRef: params.getParam('quizRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'NewsDetail',
          path: '/newsDetail',
          asyncParams: {
            'newsDoc': getDoc(['news'], NewsRecord.fromSnapshot),
          },
          builder: (context, params) => NewsDetailWidget(
            newsDoc: params.getParam('newsDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'OlimpDetail',
          path: '/olimpDetail',
          asyncParams: {
            'olimpDoc': getDoc(['quizzes'], QuizzesRecord.fromSnapshot),
          },
          builder: (context, params) => OlimpDetailWidget(
            olimpDoc: params.getParam('olimpDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'CourseDetail',
          path: '/courseDetail',
          asyncParams: {
            'coursesDoc': getDoc(['courses'], CoursesRecord.fromSnapshot),
          },
          builder: (context, params) => CourseDetailWidget(
            coursesDoc: params.getParam('coursesDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'TutorsDetail',
          path: '/tutorsDetail',
          asyncParams: {
            'tutorsDoc': getDoc(['tutors'], TutorsRecord.fromSnapshot),
          },
          builder: (context, params) => TutorsDetailWidget(
            tutorsDoc: params.getParam('tutorsDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'OnlineStudyDetail',
          path: '/onlineStudyDetail',
          asyncParams: {
            'onlineStudyDoc':
                getDoc(['online_study'], OnlineStudyRecord.fromSnapshot),
          },
          builder: (context, params) => OnlineStudyDetailWidget(
            onlineStudyDoc:
                params.getParam('onlineStudyDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AbroadStudyDetail',
          path: '/abroadStudyDetail',
          asyncParams: {
            'abroadDetail':
                getDoc(['study_abroad'], StudyAbroadRecord.fromSnapshot),
          },
          builder: (context, params) => AbroadStudyDetailWidget(
            abroadDetail: params.getParam('abroadDetail', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'WorkAbroadDetail',
          path: '/workAbroadDetail',
          asyncParams: {
            'abroadworkDoc':
                getDoc(['work_abroad'], WorkAbroadRecord.fromSnapshot),
          },
          builder: (context, params) => WorkAbroadDetailWidget(
            abroadworkDoc: params.getParam('abroadworkDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PromotionDetail',
          path: '/promotionDetail',
          asyncParams: {
            'promotionDoc':
                getDoc(['promotions'], PromotionsRecord.fromSnapshot),
          },
          builder: (context, params) => PromotionDetailWidget(
            promotionDoc: params.getParam('promotionDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'NewsCopy',
          path: '/newsCopy',
          builder: (context, params) => NewsCopyWidget(),
        ),
        FFRoute(
          name: 'aboutUs',
          path: '/aboutUs',
          builder: (context, params) => AboutUsWidget(),
        ),
        FFRoute(
          name: 'Contacts',
          path: '/contacts',
          builder: (context, params) => ContactsWidget(),
        ),
        FFRoute(
          name: 'Politic',
          path: '/politic',
          builder: (context, params) => PoliticWidget(),
        ),
        FFRoute(
          name: 'MainCopy',
          path: '/mainCopy',
          builder: (context, params) => MainCopyWidget(),
        ),
        FFRoute(
          name: 'quizResults',
          path: '/quizResults',
          builder: (context, params) => QuizResultsWidget(),
        ),
        FFRoute(
          name: 'TutorsCopy',
          path: '/tutorsCopy',
          builder: (context, params) => TutorsCopyWidget(),
        ),
        FFRoute(
          name: 'NewsDetailCopy',
          path: '/newsDetailCopy',
          asyncParams: {
            'newsDoc': getDoc(['news'], NewsRecord.fromSnapshot),
          },
          builder: (context, params) => NewsDetailCopyWidget(
            newsDoc: params.getParam('newsDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'OlimpDetailCopy',
          path: '/olimpDetailCopy',
          asyncParams: {
            'olimpDoc': getDoc(['quizzes'], QuizzesRecord.fromSnapshot),
          },
          builder: (context, params) => OlimpDetailCopyWidget(
            olimpDoc: params.getParam('olimpDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'OnlineStudyDetailCopy',
          path: '/onlineStudyDetailCopy',
          asyncParams: {
            'onlineStudyDoc':
                getDoc(['online_study'], OnlineStudyRecord.fromSnapshot),
          },
          builder: (context, params) => OnlineStudyDetailCopyWidget(
            onlineStudyDoc:
                params.getParam('onlineStudyDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'TutorsDetialCopy',
          path: '/tutorsDetialCopy',
          asyncParams: {
            'tutorsDoc': getDoc(['tutors'], TutorsRecord.fromSnapshot),
          },
          builder: (context, params) => TutorsDetialCopyWidget(
            tutorsDoc: params.getParam('tutorsDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'NewsN',
          path: '/newsN',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'NewsN') : NewsNWidget(),
        ),
        FFRoute(
          name: 'aboarStudyN',
          path: '/aboarStudyN',
          builder: (context, params) => AboarStudyNWidget(),
        ),
        FFRoute(
          name: 'abroadWorkN',
          path: '/abroadWorkN',
          builder: (context, params) => AbroadWorkNWidget(),
        ),
        FFRoute(
          name: 'CoursesN',
          path: '/coursesN',
          builder: (context, params) => CoursesNWidget(),
        ),
        FFRoute(
          name: 'onlineStudyN',
          path: '/onlineStudyN',
          builder: (context, params) => OnlineStudyNWidget(),
        ),
        FFRoute(
          name: 'testSearchPage',
          path: '/testSearchPage',
          builder: (context, params) => TestSearchPageWidget(),
        ),
        FFRoute(
          name: 'SearchResults',
          path: '/searchResults',
          builder: (context, params) => SearchResultsWidget(
            fromHeader: params.getParam('fromHeader', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SearchResultsCopy',
          path: '/searchResultsCopy',
          builder: (context, params) => SearchResultsCopyWidget(
            fromHeader: params.getParam('fromHeader', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'afterTest',
          path: '/afterTest',
          builder: (context, params) => AfterTestWidget(
            quizRef: params.getParam(
                'quizRef', ParamType.DocumentReference, false, ['quizzes']),
          ),
        ),
        FFRoute(
          name: 'quiz_CardQuestion',
          path: '/quizCardQuestion',
          builder: (context, params) => QuizCardQuestionWidget(
            sel: params.getParam('sel', ParamType.String),
            quizRef: params.getParam(
                'quizRef', ParamType.DocumentReference, false, ['quizzes']),
            index: params.getParam('index', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'afterTestCopy',
          path: '/afterTestCopy',
          builder: (context, params) => AfterTestCopyWidget(
            quizRef: params.getParam(
                'quizRef', ParamType.DocumentReference, false, ['quizzes']),
          ),
        ),
        FFRoute(
          name: 'payInfo',
          path: '/payInfo',
          builder: (context, params) => PayInfoWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/homePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/undraw_male_avatar_g98d.svg',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
