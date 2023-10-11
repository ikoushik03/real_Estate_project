// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/instance_manager.dart';
//
// import '../../../models/lead.dart';
// import '../filters/filters_controller.dart';
//
//
// class LeadListController extends GetxController {
//   List<Lead> leads = [];
//   String nextPage = '';
//   String searchText = '';
//
//   bool isSmartList = false;
//   bool isLoading = false;
//   int count = 0;
//
//   final pageController = PageController();
//
//   Future<void> onChange(value) async {
//     isSmartList = value;
//     if (value) {
//       kDebugMode
//           ? await getLeads(name: 'smart')
//           : await getLeadsFromSmartList();
//     } else {
//       final filterVC = Get.find<FilterController>();
//       filterVC.leadCollectiveFilterClear();
//       final filterString = await filterVC.applyLeadFilter();
//       await getLeads(filter: filterString);
//     }
//   }
//
//   Future<void> onRefresh() async {
//     if (isSmartList) {
//       getLeadsFromSmartList();
//     } else {
//       final filterVC = Get.find<FilterController>(tag: "lead");
//       final filterString = filterVC.filterString;
//       getLeads(filter: filterString);
//     }
//     update();
//   }
//
//   void getMoreLeads() async {
//     List<Lead> moreLeads = [];
//     if (nextPage != null) {
//       final response = await LeadsViewModel().getLeadList(
//         next: nextPage,
//       );
//       moreLeads = response[ResponseKeys.results];
//       nextPage = response[ResponseKeys.next];
//       leads = leads + moreLeads;
//       update();
//     }
//   }
//
//   int index = 0;
//
//   Future<void> getLeadsFromSmartList() async {
//     leads.clear();
//     count = 0;
//     index = 0;
//     final response = await LeadsViewModel().leadFromSmartList();
//     leads = response[ResponseKeys.results];
//     nextPage = response[ResponseKeys.next];
//     isLoading = false;
//     count = response['count'];
//     update();
//   }
//
//   void scrollToNextPage() {
//     if (pageController.offset == pageController.position.maxScrollExtent) {
//       getMoreLeads();
//     }
//     final smartLeadVC = Get.find<SmartLeadController>();
//     index = index + 1;
//     smartLeadVC.update();
//     pageController.nextPage(
//         duration: Duration(milliseconds: 50), curve: Curves.bounceIn);
//   }
//
//   Future<void> getLeads(
//       {String name = '', String next = '', String filter = ''}) async {
//     isLoading = true;
//     leads.clear();
//
//     count = 0;
//     final response = await LeadsViewModel()
//         .getLeadList(next: next, keyword: name.toLowerCase(), filter: filter);
//     leads = response[ResponseKeys.results];
//     nextPage = response[ResponseKeys.next];
//     count = response['count'];
//
//     isLoading = false;
//     update();
//   }
// }
