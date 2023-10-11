// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:matrix/matrix.dart';
// import 'package:realiq/flavor_config.dart';
// import 'package:realiq/services/push_notifications_manager.dart';
// import 'package:realiq/utility/client_manager.dart';
// import 'package:realiq/main_common.dart';
// import 'package:realiq/utility/platform_infos.dart';
// import 'package:flutter_gen/gen_l10n/l10n.dart';
// import 'package:realiq/view_models/authentication_view_model.dart';
//
// class AuthenticationController extends GetxController {
//   String? accessToken;
//   late RIQPermission role;
//   late String username;
//   String? userID;
//   late Client client;
//   late bool isChat;
//   Locale currentLocal = Locale('en');
//
//   Future<L10n> getLocalization() async {
//     L10n t = await L10n.delegate.load(currentLocal);
//     return t;
//   }
//
//   bool get isAuthenticated {
//     return (accessToken != null && userID != null);
//   }
//
//   Client getLoginClient() {
//     final loginClientCandidate = ClientManager.createClient(
//         appConfig.appTitle + DateTime.now().millisecondsSinceEpoch.toString());
//     ClientManager.addClientNameToStore(loginClientCandidate.clientName);
//     return loginClientCandidate;
//   }
//
//   void checkHomeserverAction() async {
//     await client.checkHomeserver(appConfig.apiEndpoint[Endpoints.chat]);
//   }
//
//   Future<bool> chatLogin() async {
//     final clients = await ClientManager.getClients();
//     if (clients.any((client) => client.isLogged())) {
//       client = clients.firstWhere((element) => element.isLogged());
//       update();
//       return true;
//     } else {
//       client = getLoginClient();
//       if (PlatformInfos.isMobile) {
//         await Hive.initFlutter();
//       } else {
//         Hive.init("");
//       }
//       var loginBox = await Hive.openBox("login_info");
//       final extractedUserData =
//       json.decode(loginBox.get('user_data')) as Map<String, Object>;
//       final token = extractedUserData['token'];
//       if (!client.isLogged()) {
//         checkHomeserverAction();
//         await client.login(
//           LoginType.mJWT,
//           token: token.toString(),
//           initialDeviceDisplayName: PlatformInfos.clientName,
//         );
//       }
//       final box = await Hive.openBox("matrix_token");
//       box.put("token", client.accessToken);
//     }
//
//     final token = await PushNotificationsManager().getPushNotificationsToken();
//
//     client.postPusher(
//         Pusher(
//             appId: appConfig.appID,
//             pushkey: token!,
//             appDisplayName: appConfig.appTitle,
//             deviceDisplayName: client.clientName,
//             lang: "en",
//             data: PusherData(
//                 url: Uri.parse(
//                     appConfig.apiEndpoint[Endpoints.chatNotificationGateway]!),
//                 format: "event_id_only"),
//             kind: 'http'),
//         append: true);
//
//     return client.isLogged();
//   }
// }
