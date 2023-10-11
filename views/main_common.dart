// import 'dart:async';
//
// import 'package:caller/caller.dart';
// import 'package:camera/camera.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_gen/gen_l10n/l10n.dart';
// import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
// import 'package:get/get.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:path_provider_android/path_provider_android.dart';
// import 'package:provider/provider.dart';
// import 'package:realiq/constants.dart';
// import 'package:realiq/flavor_config.dart';
// import 'package:realiq/services/crashlytics_manager.dart';
// import 'package:realiq/services/misc.dart';
// import 'package:realiq/services/push_notifications_manager.dart';
// import 'package:realiq/utility/platform_infos.dart';
// import 'package:realiq/view_models/authentication_view_model.dart';
// import 'package:realiq/view_models/call_log_view_model.dart';
// import 'package:realiq/view_models/matrix.dart';
// import 'package:realiq/view_models/notification_vm.dart';
// import 'package:realiq/view_models/project_view_model.dart';
// import 'package:realiq/views/components/circularProgessIndicator.dart';
// import 'package:realiq/views/controller/authentication_controller.dart';
// import 'package:realiq/views/controller/base_screen_controller.dart';
// import 'package:realiq/views/controller/chat_getx_controller.dart';
// import 'package:realiq/views/controller/notification_screen_controller.dart';
// import 'package:realiq/views/screens/authentication/authentication_screen.dart';
// import 'package:realiq/views/screens/base_screen.dart';
// import 'package:realiq/views/screens/camera/CameraScreen.dart';
// import 'package:realiq/views/theme/app_theme.dart';
// import 'package:workmanager/workmanager.dart';
//
// import '../view_models/authentication_view_model.dart';
// import '../view_models/notification_vm.dart';
// import '../view_models/profile_view_model.dart';
// import 'controller/notification_screen_controller.dart';
// import 'controller/widgets/authentication_controller.dart';
// import 'controller/widgets/chat_getx_controller.dart';
// import 'view_models/matrix.dart';
// import 'view_models/profile_view_model.dart';
//
// Future<void> initializeCallHandler() async {
//   Caller.initialize(CallLogViewModel.callerCallbackHandler);
// }
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   PushNotificationsManager().showNotification(message);
// }
//
// late FlavorConfig appConfig;
//
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//     CallLogViewModel.sendCallLogsFromLocal();
//     return Future.value(true);
//   });
// }
//
// void mainCommon(FlavorConfig flavorConfig) async {
//   appConfig = flavorConfig;
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//
//   if (PlatformInfos.isAndroid) {
//     PathProviderAndroid.registerWith();
//     await Firebase.initializeApp();
//     cameras = await availableCameras();
//     initializeDateFormatting();
//     initializeCallHandler();
//
//     await FlutterLibphonenumber().init();
//     Workmanager().initialize(
//       callbackDispatcher,
//       isInDebugMode: false,
//     );
//     Workmanager().registerPeriodicTask("3", "simplePeriodicTask",
//         initialDelay: Duration(seconds: 10), frequency: Duration(minutes: 15));
//   }
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//   if (PlatformInfos.isAndroid) {
//     runZonedGuarded(() async {
//       WidgetsFlutterBinding.ensureInitialized();
//       await Firebase.initializeApp();
//       runApp(MyApp());
//     }, FirebaseCrashlytics.instance.recordError);
//   } else {
//     await Firebase.initializeApp(options: appConfig.firebaseWebOption);
//     WidgetsFlutterBinding.ensureInitialized();
//     runApp(MyApp());
//   }
// }
//
// OverlayEntry? overlayEntry;
// bool isHintShown = false;
// String currentLayout = "";
// ConnectivityResult? connectivityResult;
//
// GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
// class MyApp extends StatelessWidget {
//   final baseScreenController = Get.put(BaseScreenController(), permanent: true);
//   final authenticationController =
//   Get.put(AuthenticationController(), permanent: true);
//   final chatController = Get.put(ChatGetxController(), permanent: true);
//   final notificationVC = Get.put(NotificationVC(), permanent: true);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider<NotificationVM>(
//               create: (_) => NotificationVM()),
//           ChangeNotifierProvider<Matrix>(create: (_) => Matrix()),
//           ChangeNotifierProvider<ProfileViewModel>(
//               create: (_) => ProfileViewModel()),
//           ChangeNotifierProvider<ProjectViewModel>(
//               create: (_) => ProjectViewModel()),
//         ],
//         builder: (context, child) {
//           return GetMaterialApp(
//             locale: Locale('en'),
//             localizationsDelegates: [
//               L10n.delegate,
//             ],
//             supportedLocales: [Locale('en', '')],
//             builder: (context, child) {
//               return MediaQuery(
//                   data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
//                   child: child!);
//             },
//             navigatorKey: navigatorKey,
//             title: 'RealIQ',
//             debugShowCheckedModeBanner: false,
//             theme: RIQTheme.light,
//             home: MyHomePage(),
//           );
//         });
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({
//     Key? key,
//   }) : super(key: key);
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // Platform messages are asynchronous, so we initialize in an async method.
//
//   @override
//   void initState() {
//     if (PlatformInfos.isAndroid) RIQCrashlytics.initializeFlutterFire();
//     super.initState();
//   }
//
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final authenticationController = Get.find<AuthenticationController>();
//     if (PlatformInfos.isMobile) if (appConfig.appID == prodAppID)
//       Future.delayed(Duration(seconds: 5)).then((value) {
//         MiscServices.inAppUpdate(context);
//       });
//
//     return FutureBuilder(
//         future: AuthenticationViewModel().tryAutoLogIn(),
//         builder: (_, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Scaffold(
//               backgroundColor: Colors.white,
//               body: Center(
//                 child: RIQCircularProgressIndicator(),
//               ),
//             );
//           } else if (snapshot.connectionState == ConnectionState.done) {
//             if (authenticationController.isAuthenticated) {
//               PushNotificationsManager().configureNotification(context);
//               return BaseScreen();
//             } else {
//               return AuthenticationScreen();
//             }
//           }
//           return Container();
//         });
//   }
// }
