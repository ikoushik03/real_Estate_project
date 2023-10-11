// import 'package:get/get.dart';
// import 'package:realiq/config/response_keys.dart';
// import 'package:realiq/models/notifications.dart';
// import 'package:realiq/view_models/notification_vm.dart';
// import 'package:realiq/views/screens/calendar_screen.dart';
// import 'package:realiq/views/screens/lead_details/lead_detail_screen.dart';
//
// import '../../models/notifications.dart';
//
// class NotificationVC extends GetxController {
//   String? next;
//
//   List<Notifications> notifications = [];
//
//   bool isLoading = false;
//   bool isLazyLoading = false;
//   bool filterByUnread = false;
//   int count = 0;
//
//   void onInit() async {
//     super.onInit();
//     await getNotifications();
//   }
//
//   Future<void> getCount() async {
//     count = await NotificationVM().getNotificationCount();
//     update();
//   }
//
//   Future<void> getNotifications(
//       {String nextPage = "", String filterString = ""}) async {
//     isLoading = true;
//     await Future.delayed(Duration(milliseconds: 500));
//     update();
//     final response = await NotificationVM()
//         .getNotifications(nextPage: nextPage, filterString: filterString);
//     notifications = response[ResponseKeys.results];
//     next = response[ResponseKeys.next];
//     isLoading = false;
//     try {
//       await NotificationVM().markAllAsRead();
//       await getCount();
//     } catch (e) {}
//
//     update();
//   }
//
//   Future<void> getMoreNotifications() async {
//     if (next != null) {
//       final response = await NotificationVM().getNotifications(nextPage: next!);
//       final moreNotification = response[ResponseKeys.results];
//       next = response[ResponseKeys.next];
//       notifications = notifications + moreNotification;
//     }
//     update();
//   }
//
//   void route({String? type, int? leadID}) {
//     switch (type) {
//       case "site_visit_notification":
//         Get.to(CalendarScreen(
//           isMain: false,
//         ));
//         break;
//       case "site_visit_reminder":
//         Get.to(CalendarScreen(
//           isMain: false,
//         ));
//
//         break;
//       case "inbound_lead_notification":
//         if (leadID != null)
//           Get.to(
//             LeadDetailsScreen(
//               leadID: leadID,
//             ),
//           );
//         break;
//       case "assignee_lead_notification":
//         if (leadID != null)
//           Get.to(
//             LeadDetailsScreen(
//               leadID: leadID,
//             ),
//           );
//         break;
//       case "booking_notification":
//         if (leadID != null)
//           Get.to(
//             LeadDetailsScreen(
//               leadID: leadID,
//             ),
//           );
//         break;
//       case "closure_notification":
//         if (leadID != null)
//           Get.to(
//             LeadDetailsScreen(
//               leadID: leadID,
//             ),
//           );
//         break;
//       case "lead_followup_notification":
//         if (leadID != null)
//           Get.to(
//             LeadDetailsScreen(
//               leadID: leadID,
//             ),
//           );
//         break;
//       default:
//     }
//   }
// }
