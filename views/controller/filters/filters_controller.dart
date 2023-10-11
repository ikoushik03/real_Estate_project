// // @dart=2.9
// import 'package:flutter/material.dart';
// import 'package:get/instance_manager.dart';
// import 'package:get/state_manager.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:jiffy/jiffy.dart';
// import 'package:realiq/config/enums.dart';
// import 'package:realiq/constants.dart';
// import 'package:realiq/models/agent.dart';
// import 'package:realiq/view_models/requirement_view_model.dart';
// import 'package:realiq/views/controller/app_state_controller.dart';
// import 'package:realiq/views/controller/authentication_controller.dart';
// import 'package:realiq/views/controller/filters/agent_list_controller.dart';
// import 'package:realiq/views/controller/filters/booking_timeline_controller.dart';
// import 'package:realiq/views/controller/filters/budget_picker_controller.dart';
// import 'package:realiq/views/controller/filters/campaign_list_controller.dart';
// import 'package:realiq/views/controller/filters/developer_list_controller.dart';
// import 'package:realiq/views/controller/filters/lead_source_list.controller.dart';
// import 'package:realiq/views/controller/filters/location_list_controller.dart';
// import 'package:realiq/views/controller/filters/possession_controller.dart';
// import 'package:realiq/views/controller/filters/property_type_list.dart';
// import 'package:realiq/views/controller/filters/sort_controller.dart';
// import 'package:realiq/views/controller/filters/stage_list_controller.dart';
// import 'package:realiq/views/controller/filters/tag_list_controller.dart';
// import 'package:realiq/views/controller/filters/time_frame_list_controller.dart';
// import 'package:realiq/utility.dart';
//
// class FilterController extends GetxController {
//   final bool isReport;
//
//   final FilterScreen screen;
//   FilterController(this.isReport, this.screen);
//   AuthenticationController authController =
//   Get.find<AuthenticationController>();
//   AgentListController agentListVC;
//   CampaignListController campaignListVC;
//   TimeFrameListController timeFrameListVC;
//   SortListController sortListVC;
//   StageListController stageListVC;
//   BookingTimelineController bookingTimeListVC;
//   PossessionController possessionListVC;
//   LocationListController locationListVC;
//   DeveloperListController developerListVC;
//   TagListController leadTagListVC;
//   PropertyTypeController propertyTypeListVC;
//   BudgetPickerController budgetVC;
//   LeadSourceListVC sourceListVC;
//   AppStateController appStateVC = Get.find<AppStateController>();
//
//   Map<FilterType, bool> appliedFilters = {
//     FilterType.Agent: false,
//     FilterType.Sort: false,
//     FilterType.Stages: false,
//     FilterType.BookingTime: false,
//     FilterType.Campaign: false,
//     FilterType.Location: false,
//     FilterType.Possession: false,
//     FilterType.PropertyType: false,
//     FilterType.Tags: false,
//     FilterType.Budget: false,
//     FilterType.TimeFrame: false,
//     FilterType.Developer: false,
//     FilterType.Bookmark: false,
//     FilterType.LeadSource: false,
//   };
//
//   void onInit() {
//     super.onInit();
//     if (isReport) {
//       agentListVC =
//           Get.put(AgentListController(false), tag: getFilterTags(screen));
//       campaignListVC =
//           Get.put(CampaignListController(), tag: getFilterTags(screen));
//       timeFrameListVC =
//           Get.put(TimeFrameListController(), tag: getFilterTags(screen));
//     } else {
//       agentListVC =
//           Get.put(AgentListController(false), tag: getFilterTags(screen));
//       bookingTimeListVC =
//           Get.put(BookingTimelineController(), tag: getFilterTags(screen));
//       sourceListVC = Get.put(LeadSourceListVC(), tag: getFilterTags(screen));
//       budgetVC = Get.put(BudgetPickerController(), tag: getFilterTags(screen));
//       campaignListVC =
//           Get.put(CampaignListController(), tag: getFilterTags(screen));
//       developerListVC =
//           Get.put(DeveloperListController(), tag: getFilterTags(screen));
//       locationListVC =
//           Get.put(LocationListController(), tag: getFilterTags(screen));
//       possessionListVC =
//           Get.put(PossessionController(), tag: getFilterTags(screen));
//       propertyTypeListVC =
//           Get.put(PropertyTypeController(), tag: getFilterTags(screen));
//       sortListVC = Get.put(SortListController(), tag: getFilterTags(screen));
//       stageListVC = Get.put(StageListController(), tag: getFilterTags(screen));
//       leadTagListVC = Get.put(TagListController(), tag: getFilterTags(screen));
//       timeFrameListVC =
//           Get.put(TimeFrameListController(), tag: getFilterTags(screen));
//     }
//   }
//
//   void onClose() {
//     super.onClose();
//     delete();
//   }
//
//   Future<void> delete() async {
//     Get.delete<LeadSourceListVC>(tag: getFilterTags(screen));
//     Get.delete<AgentListController>(tag: getFilterTags(screen));
//     Get.delete<BookingTimelineController>(tag: getFilterTags(screen));
//     Get.delete<BudgetPickerController>(tag: getFilterTags(screen));
//     Get.delete<CampaignListController>(tag: getFilterTags(screen));
//     Get.delete<DeveloperListController>(tag: getFilterTags(screen));
//     Get.delete<LocationListController>(tag: getFilterTags(screen));
//     Get.delete<PossessionController>(tag: getFilterTags(screen));
//     Get.delete<PropertyTypeController>(tag: getFilterTags(screen));
//     Get.delete<SortListController>(tag: getFilterTags(screen));
//     Get.delete<StageListController>(tag: getFilterTags(screen));
//     Get.delete<TagListController>(tag: getFilterTags(screen));
//     Get.delete<TimeFrameListController>(tag: getFilterTags(screen));
//   }
//
//   RxInt count = 0.obs;
//
//   String filterString = '';
//
//   Future<String> applySalesFilter() async {
//     filterString = '';
//     filterString += await getAgentString();
//     filterString += getTimeFrameString();
//     update();
//     return filterString;
//   }
//
//   Future<String> applyActivityFilter() async {
//     filterString = '';
//     filterString += await getAgentString();
//     filterString += getTimeFrameString();
//     update();
//     return filterString;
//   }
//
//   Future<String> applyMarketingFilter() async {
//     filterString = '';
//     filterString += getCampaignString();
//     filterString += getTimeFrameString();
//     update();
//
//     return filterString;
//   }
//
//   Future<String> applyLeadFilter() async {
//     filterString = '';
//     count = 0.obs;
//     filterString += await getAgentString();
//     filterString += getSortString();
//     filterString += await getStageString();
//     filterString += getLocationString();
//     filterString += getBoookingString();
//     filterString += getPossessionString();
//     filterString += getCampaignString();
//     filterString += getTagString();
//     filterString += propertyTypeString();
//     filterString += getBudgetString();
//     filterString += await settingsFilter();
//     filterString += await getSourceString();
//     appliedFilters.forEach((key, value) {
//       if (value) {
//         count = count + 1;
//       }
//     });
//     update();
//
//     return filterString;
//   }
//
//   Future<String> applyProjectFilter() async {
//     filterString = '';
//     count = 0.obs;
//
//     filterString += getBookmarkString();
//     filterString += getSortString();
//     filterString += getDeveloperString();
//     filterString += getLocationString();
//     filterString += getBoookingString();
//     filterString += getPossessionString();
//     filterString += getCampaignString();
//     filterString += propertyTypeString();
//     filterString += getBudgetString();
//
//     appliedFilters.forEach((key, value) {
//       if (value) {
//         count = count + 1;
//       }
//     });
//     update();
//     return filterString;
//   }
//
//   void leadCollectiveFilterApply() {
//     appliedFilters.forEach((key, value) {
//       appliedFilters[key] = true;
//     });
//     appliedFilters[FilterType.TimeFrame] = false;
//     appliedFilters[FilterType.Developer] = false;
//     appliedFilters[FilterType.Bookmark] = false;
//   }
//
//   void projectCollectiveFilterApply() {
//     appliedFilters.forEach((key, value) {
//       appliedFilters[key] = true;
//     });
//     appliedFilters[FilterType.Bookmark] = false;
//     appliedFilters[FilterType.TimeFrame] = false;
//     appliedFilters[FilterType.Stages] = false;
//     appliedFilters[FilterType.Agent] = false;
//     appliedFilters[FilterType.Tags] = false;
//     appliedFilters[FilterType.LeadSource] = false;
//     appliedFilters[FilterType.Campaign] = false;
//   }
//
//   void leadCollectiveFilterClear() {
//     appliedFilters.forEach((key, value) {
//       appliedFilters[key] = false;
//     });
//   }
//
//   void filterClear() {
//     appliedFilters.forEach((key, value) {
//       appliedFilters[key] = false;
//     });
//   }
//
// // FilterStrings
//
//   Future<void> onCollectiveFilterOpen() async {
//     // Sort Filter
//
//     sortListVC.selectedSort = sortListVC.appliedSort;
//     sortListVC.update();
//
//     agentListVC.selectedAgent = agentListVC.appliedAgent;
//     agentListVC.reset();
//     agentListVC.update();
//
//     bookingTimeListVC.selectedValue = bookingTimeListVC.appliedValue;
//     bookingTimeListVC.update();
//
//     budgetVC.selectedBudget = budgetVC.appliedBudget;
//     budgetVC.update();
//
//     campaignListVC.selectedCampaigns = List.of(campaignListVC.appliedCampaigns);
//     campaignListVC.update();
//
//     developerListVC.selectedDevelopers =
//         List.of(developerListVC.appliedDevelopers);
//     developerListVC.update();
//
//     locationListVC.selectedLocations = List.of(locationListVC.appliedLocations);
//     locationListVC.update();
//
//     possessionListVC.selectedValue = possessionListVC.appliedValue;
//     possessionListVC.update();
//
//     propertyTypeListVC.selectedPropertyType =
//         propertyTypeListVC.appliedPropertyType;
//     propertyTypeListVC.selectedUnitTypes =
//         List.of(propertyTypeListVC.appliedUnitTypes);
//     propertyTypeListVC.selectedDimension =
//         List.of(propertyTypeListVC.appliedDimension);
//     propertyTypeListVC.update();
//
//     stageListVC.selectedStage = List.of(stageListVC.appliedStage);
//     stageListVC.update();
//
//     leadTagListVC.selectedTags = List.of(leadTagListVC.appliedTags);
//     leadTagListVC.update();
//
//     sourceListVC.selectedSources = List.of(sourceListVC.appliedSources);
//     sourceListVC.update();
//
//     timeFrameListVC.selectedTimeFrame = timeFrameListVC.appliedTimeFrame;
//     timeFrameListVC.update();
//   }
//
//   String getTimeFrameString() {
//     String timeFrameString = '';
//     if (appliedFilters[FilterType.TimeFrame] &&
//         timeFrameListVC.selectedTimeFrame != "This Month") {
//       timeFrameListVC.appliedTimeFrame = timeFrameListVC.selectedTimeFrame;
//       if (timeFrameListVC.selectedTimeFrame == "This Week") {
//         timeFrameString = '&timeframe=week';
//       } else if (timeFrameListVC.selectedTimeFrame == "This Month") {
//         timeFrameString = '&timeframe=month';
//       } else if (timeFrameListVC.selectedTimeFrame == "This Quater") {
//         timeFrameString = '&timeframe=quarter';
//       }
//     } else {
//       appliedFilters[FilterType.TimeFrame] = false;
//       timeFrameListVC.selectedTimeFrame = "This Month";
//       timeFrameListVC.appliedTimeFrame = "This Month";
//       timeFrameString = '&timeframe=month';
//     }
//     return timeFrameString;
//   }
//
//   String getBudgetString() {
//     String filterString = '';
//     if (appliedFilters[FilterType.Budget] && budgetVC.selectedBudget != 0) {
//       budgetVC.appliedBudget = budgetVC.selectedBudget;
//       filterString += '&budget=${budgetVC.appliedBudget}';
//     } else {
//       budgetVC.appliedBudget = 0;
//       budgetVC.selectedBudget = 0;
//       budgetVC.budgetController.text = '';
//       appliedFilters[FilterType.Budget] = false;
//     }
//     return filterString;
//   }
//
//   String getBookmarkString() {
//     String filterString = '';
//     if (appliedFilters[FilterType.Bookmark]) {
//       filterString += '&bookmark=true';
//     } else {
//       filterString += '';
//     }
//     return filterString;
//   }
//
//   String getTagString() {
//     String filterString = '';
//     if (appliedFilters[FilterType.Tags] &&
//         leadTagListVC.selectedTags.isNotEmpty) {
//       leadTagListVC.appliedTags = List.of(leadTagListVC.selectedTags);
//       for (var tag in leadTagListVC.appliedTags) {
//         if (leadTagListVC.appliedTags.indexOf(tag) == 0) {
//           filterString = '&tags__in==${tag.name}';
//         } else {
//           filterString += '__${tag.name}';
//         }
//       }
//     } else {
//       appliedFilters[FilterType.Tags] = false;
//       leadTagListVC.selectedTags = [];
//       leadTagListVC.appliedTags = List.of(leadTagListVC.selectedTags);
//       //  filterString += '&tags__exclude=Junk';
//       filterString += '&active=True';
//     }
//     return filterString;
//   }
//
//   Future<String> settingsFilter() async {
//     await Hive.initFlutter();
//     final appSettings = await Hive.openBox('user_settings');
//     final filter = appSettings.get('lead_time_frame');
//
//     if (filter == "3 months") {
//       return '&last_activity_ts__gte=${Jiffy(DateTime.now()).subtract(months: 3).format()}';
//     } else if (filter == "6 months") {
//       return '&last_activity_ts__gte=${Jiffy(DateTime.now()).subtract(months: 6).format()}';
//     } else if (filter == "1 year") {
//       return '&last_activity_ts__gte=${Jiffy(DateTime.now()).subtract(months: 12).format()}';
//     } else {
//       return "";
//     }
//   }
//
//   String propertyTypeString() {
//     String filterString = '';
//     if (appliedFilters[FilterType.PropertyType] &&
//         propertyTypeListVC.selectedPropertyType != 'All') {
//       filterString +=
//       '${screen == FilterScreen.Lead ? '&property_type' : '&type'}=${propertyTypeListVC.selectedPropertyType}';
//       for (var unitType in propertyTypeListVC.selectedUnitTypes) {
//         if (propertyTypeListVC.selectedUnitTypes.indexOf(unitType) == 0) {
//           filterString += '&bhk__in=$unitType';
//         } else {
//           filterString += '__$unitType';
//         }
//       }
//       for (var dimension in propertyTypeListVC.selectedDimension) {
//         final dimensions =
//         RequirementViewModel().getDimensionsFromString(dimension);
//         if (propertyTypeListVC.selectedDimension.indexOf(dimension) == 0) {
//           filterString += '&plot_size_sqft__in=$dimensions';
//         } else {
//           filterString += '__$dimensions';
//         }
//       }
//       propertyTypeListVC.appliedDimension =
//           List.of(propertyTypeListVC.selectedDimension);
//       propertyTypeListVC.appliedPropertyType =
//           propertyTypeListVC.selectedPropertyType;
//       propertyTypeListVC.appliedUnitTypes =
//           List.of(propertyTypeListVC.selectedUnitTypes);
//     } else {
//       appliedFilters[FilterType.PropertyType] = false;
//       propertyTypeListVC.selectedDimension = [];
//       propertyTypeListVC.selectedPropertyType = 'All';
//       propertyTypeListVC.appliedPropertyType = 'All';
//       propertyTypeListVC.selectedUnitTypes = [];
//       propertyTypeListVC.appliedDimension =
//           List.of(propertyTypeListVC.selectedDimension);
//       propertyTypeListVC.appliedPropertyType =
//           propertyTypeListVC.selectedPropertyType;
//       propertyTypeListVC.appliedUnitTypes =
//           List.of(propertyTypeListVC.selectedUnitTypes);
//     }
//     propertyTypeListVC.reset();
//     return filterString;
//   }
//
//   String getCampaignString() {
//     String filterString = '';
//     if (appliedFilters[FilterType.Campaign] &&
//         campaignListVC.selectedCampaigns.isNotEmpty) {
//       campaignListVC.appliedCampaigns =
//           List.of(campaignListVC.selectedCampaigns);
//       for (var campaign in campaignListVC.appliedCampaigns) {
//         filterString += '&campaign=${campaign.id}';
//       }
//     } else {
//       appliedFilters[FilterType.Campaign] = false;
//       campaignListVC.selectedCampaigns = [];
//       campaignListVC.appliedCampaigns =
//           List.of(campaignListVC.selectedCampaigns);
//     }
//     campaignListVC.reset();
//     return filterString;
//   }
//
//   String getPossessionString() {
//     String filterString = '';
//     if (appliedFilters[FilterType.Possession] &&
//         possessionListVC.selectedValue.isNotEmpty) {
//       possessionListVC.appliedValue = possessionListVC.selectedValue;
//
//       if (possessionListVC.selectedValue != "12+ months") {
//         filterString +=
//         '&possession_date__lte=${getBookingDate(possessionListVC.selectedValue).toIso8601String()}';
//       } else {
//         filterString +=
//         '&possession_date__gte=${getBookingDate("In a year").toIso8601String()}';
//       }
//     } else {
//       appliedFilters[FilterType.Possession] = false;
//       possessionListVC.selectedValue = '';
//       possessionListVC.appliedValue = possessionListVC.selectedValue;
//     }
//     return filterString;
//   }
//
//   String getBoookingString() {
//     String filterString = '';
//     if (appliedFilters[FilterType.BookingTime] &&
//         bookingTimeListVC.selectedValue.isNotEmpty) {
//       bookingTimeListVC.appliedValue = bookingTimeListVC.selectedValue;
//       if (bookingTimeListVC.selectedValue != "12+ months") {
//         filterString +=
//         '&booking_in_date__lte=${getBookingDate(bookingTimeListVC.selectedValue).toIso8601String()}';
//       } else {
//         filterString +=
//         '&booking_in_date__gte=${getBookingDate("In a year").toIso8601String()}';
//       }
//     } else {
//       appliedFilters[FilterType.BookingTime] = false;
//       bookingTimeListVC.selectedValue = '';
//       bookingTimeListVC.appliedValue = bookingTimeListVC.selectedValue;
//     }
//
//     return filterString;
//   }
//
//   String getDeveloperString() {
//     String developerString = '';
//     if (appliedFilters[FilterType.Developer] &&
//         developerListVC.selectedDevelopers.isNotEmpty) {
//       developerListVC.appliedDevelopers =
//           List.of(developerListVC.selectedDevelopers);
//       for (var developer in developerListVC.appliedDevelopers) {
//         if (developerListVC.appliedDevelopers.indexOf(developer) == 0) {
//           developerString = '&organization_id__in==${developer.id}';
//         } else {
//           developerString += '__${developer.id}';
//         }
//       }
//     } else {
//       appliedFilters[FilterType.Developer] = false;
//       developerListVC.appliedDevelopers = [];
//       developerListVC.selectedDevelopers =
//           List.of(developerListVC.appliedDevelopers);
//     }
//     developerListVC.reset();
//     return developerString;
//   }
//
//   Future<String> getSourceString() async {
//     String sourceFilterString = '';
//     if (appliedFilters[FilterType.LeadSource] &&
//         sourceListVC.selectedSources.isNotEmpty) {
//       sourceListVC.appliedSources = List.of(sourceListVC.selectedSources);
//       for (var source in sourceListVC.appliedSources) {
//         if (sourceListVC.appliedSources.indexOf(source) == 0) {
//           sourceFilterString = '&lead_source__in=${source.id}';
//         } else {
//           sourceFilterString += '__${source.id}';
//         }
//       }
//     } else {
//       appliedFilters[FilterType.LeadSource] = false;
//       sourceListVC.appliedSources = [];
//       sourceListVC.selectedSources = List.of(sourceListVC.appliedSources);
//     }
//     sourceListVC.reset();
//     return sourceFilterString;
//   }
//
//   String getLocationString() {
//     String locationFilterString = '';
//     if (appliedFilters[FilterType.Location] &&
//         locationListVC.selectedLocations.isNotEmpty) {
//       locationListVC.appliedLocations =
//           List.of(locationListVC.selectedLocations);
//       for (var location in locationListVC.appliedLocations) {
//         if (locationListVC.appliedLocations.indexOf(location) == 0) {
//           screen == FilterScreen.Lead
//               ? locationFilterString =
//           '&location__in=${location.name.toString().toLowerCase()}'
//               : locationFilterString =
//           '&location_tags__in=${location.name.toString().toLowerCase()}';
//         } else {
//           locationFilterString += '__${location.name.toString().toLowerCase()}';
//         }
//       }
//     } else {
//       appliedFilters[FilterType.Location] = false;
//       locationListVC.appliedLocations = [];
//       locationListVC.selectedLocations =
//           List.of(locationListVC.appliedLocations);
//     }
//     locationListVC.reset();
//     return locationFilterString;
//   }
//
//   Future<String> getStageString() async {
//     String filterString = '';
//     if (appliedFilters[FilterType.Stages] &&
//         stageListVC.selectedStage.isNotEmpty) {
//       stageListVC.appliedStage = List.of(stageListVC.selectedStage);
//       for (var leadStage in stageListVC.appliedStage) {
//         if (leadStage == "Inactive") {
//           filterString += '&inactive=true';
//         }
//         if (leadStage == "Junk") {
//           filterString += '&junk=true';
//         }
//         filterString += '&stage=$leadStage';
//       }
//     } else {
//       appliedFilters[FilterType.Stages] = false;
//       stageListVC.appliedStage = [];
//       stageListVC.selectedStage = [];
//       stageListVC.leadStage = stageListVC.original;
//     }
//     stageListVC.reset();
//     return filterString;
//   }
//
//   String getSortString() {
//     String filterString = '';
//     if (appliedFilters[FilterType.Sort] &&
//         sortListVC.selectedSort != "Last modified") {
//       sortListVC.appliedSort = sortListVC.selectedSort;
//       filterString += sortListVC.sortMap[sortListVC.appliedSort];
//     } else {
//       appliedFilters[FilterType.Sort] = false;
//       sortListVC.appliedSort = "Last modified";
//       sortListVC.selectedSort = sortListVC.appliedSort;
//       filterString += sortListVC.sortMap[sortListVC.appliedSort];
//     }
//     return filterString;
//   }
//
//   Future<String> getAgentString() async {
//     String filterString = '';
//     if (appliedFilters[FilterType.Agent] &&
//         agentListVC.selectedAgent.id != int.parse(authController.userID)) {
//       agentListVC.appliedAgent = agentListVC.selectedAgent;
//       if (agentListVC.appliedAgent.id == 0) {
//         filterString += '&owner_id__exists=false';
//       } else if (agentListVC.appliedAgent.id == -1) {
//         filterString += '&owner_id=';
//       } else {
//         filterString += '&owner_id=${agentListVC.appliedAgent.id}';
//       }
//     } else {
//       appliedFilters[FilterType.Agent] = false;
//       agentListVC.selectedAgent = Agent(
//           id: int.parse(authController.userID), name: authController.username);
//       agentListVC.appliedAgent = agentListVC.selectedAgent;
//       filterString += '&owner_id=${agentListVC.appliedAgent.id}';
//     }
//     agentListVC.reset();
//     return filterString;
//   }
//
//   double getTopHeight(GlobalKey filterContainerKey) {
//     var box = filterContainerKey.currentContext.findRenderObject() as RenderBox;
//     var offset = box.localToGlobal(Offset.zero);
//     return offset.dy; //+ box.size.height;
//   }
// }
