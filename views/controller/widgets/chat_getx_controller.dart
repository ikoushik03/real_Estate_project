// import 'dart:async';
// import 'dart:convert';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/state_manager.dart';
// import 'package:matrix/matrix.dart';
// import 'package:realiq/flavor_config.dart';
// import 'package:realiq/http_requests.dart';
// import 'package:realiq/main_common.dart';
// import 'package:realiq/services/api_request.dart';
//
// class ChatGetxController extends GetxController {
//   String? activeRoomId;
//   List<String> uploadingRoomID = [];
//
//   StreamController<String> audioPlayerID = StreamController.broadcast();
//
//   List<String> leadRooms = [];
//
//   List<dynamic> sharedContentList = [];
//
//   bool isSharedFromOutside = false;
//
//   bool gotInitialLink = false;
//
//   Map<String, dynamic>? get shareContent => _shareContent;
//   set shareContent(Map<String, dynamic>? content) {
//     _shareContent = content;
//     onShareContentChanged.add(_shareContent);
//   }
//
//   Map<String, dynamic>? _shareContent;
//
//   final StreamController<Map<String, dynamic>?> onShareContentChanged =
//   StreamController.broadcast();
//
//   @override
//   void onClose() {
//     super.onClose();
//     audioPlayerID.close();
//   }
//
//   @override
//   void onInit() async {
//     super.onInit();
//   }
//
//   List<Profile> profile = [];
//
//   String? next;
//
//   Future<void> getMoreUsers() async {
//     List<Profile> more = [];
//     if (next != null) {
//       more = await searchUserDirectory(nextPage: next!);
//     }
//     profile = profile + more;
//     update();
//   }
//
//   bool isLoading = false;
//
//   Future<void> getUsers({String name = ''}) async {
//     profile = await searchUserDirectory(name: name);
//     isLoading = false;
//     update();
//   }
//
//   Future<List<Profile>> searchUserDirectory(
//       {String name = '', String nextPage = ''}) async {
//     List<Profile> searchProfile = [];
//     String api;
//     if (nextPage.isNotEmpty) {
//       api = nextPage;
//     } else if (name.isEmpty) {
//       api = '/login/search/';
//     } else {
//       api = '/login/search/?name=${name.toLowerCase()}';
//     }
//     var response = await getRequest(
//       accessToken: authenticationController.accessToken!,
//       api: api,
//       successStatusCode: 200,
//     );
//     if (response.didSucceed) {
//       var jsonResponses = json.decode(response.object);
//       if (jsonResponses['next'] != null) {
//         next = jsonResponses['next']
//             .toString()
//             .replaceAll(appConfig.apiEndpoint[Endpoints.base]!, '');
//       } else {
//         next = jsonResponses['next'];
//       }
//       for (var jsonResponse in jsonResponses['results']) {
//         Map<String, dynamic> json = {};
//         json['avatar_url'] = jsonResponse['photo'];
//         json["user_id"] = jsonResponse['chat_id'];
//         json["display_name"] = jsonResponse['name'];
//         if (json["display_name"] != null &&
//             json['avatar_url'] != null &&
//             json["user_id"] != null) searchProfile.add(Profile.fromJson(json));
//       }
//     }
//     return searchProfile;
//   }
// }
