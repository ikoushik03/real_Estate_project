import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/notifications.dart';

const IS_DEVELOPMENT = true;
const COMING_SOON = 'Coming Soon!';
//final backendURL = 'https://staging.realiq.ai/api/v1/';
final backendURL = 'https://dev.codemonk.in/api/v1/';
final cloudinaryAPIKEY = '491411685921554';
final cloudinaryCloudName = 'daslpstyk';
final uploadPreset = 'cnaluiwvbauysb';
final cloudinaryUploadURL = 'https://api.cloudinary.com/v1_1/daslpstyk/upload';
final mapAPI = "AIzaSyAILn7obZuHSB4eLJxHl3tCIfCBSDgpVYo";
final placesBaseUrl =
    'https://maps.googleapis.com/maps/api/place/autocomplete/json';
final prodAppID = 'io.realiq.cpconnect';
final assetsDirectory = 'assets/images/';

final emptyRequirementsText =
    "You’ve not booked any property for your lead yet. Book a property only after lead approves.";

final genericErrorMessage = 'Something went wrong. Please try again.';
final internetUnavailableMessage =
    'Please check your internet connection and try again.';
final underConstructionKey = 'Under Construction';
const noLeadsMessage =
    'Uh-oh! You don’t have any leads as of now. Add your first potential lead by clicking on add lead button below.';
const leadsEmptyResult = 'No results found. Readjust your filters.';
final propertyTypes = ['Apartment', 'Villa', 'Plot'];
final unitTypes = [
  '1 BHK',
  '2 BHK',
  '2.5 BHK',
  '3 BHK',
  '3.5 BHK',
  '4 BHK',
  '4+ BHK'
];
final purchasePurposeList = ["Living", "Investment"];
final months = [
  "Jan",
  "Feb",
  "Mar",
  "April",
  "May",
  "June",
  "July",
  "Aug",
  "Sept",
  "Oct",
  "Nov",
  "Dec"
];
final leadPriorities = ['Hot 🔥', 'Cold ❄️', 'None'];
List<String> leadStageStatuses = [
  "Initial",
  "Match",
  "Proposal",
  "Site Visit",
  "Booking Done",
  "Closure"
];

final currency = "₹";
final possessionTypes = ['In 3 months', 'In 6 months', 'In a year'];
final propertyStatuses = ['Ready to move in', 'Under Construction'];
List<String> activityList = [
  'Matches',
  'Lead Followup',
  'Site Visit Done',
  'Site Visit Cancelled',
  'Booking Done',
  'Site Visit Scheduled'
];
final leadStatusList = [
  "Initial",
  "Match",
  "Proposal",
  "Site Visit",
  "Booking Done",
  "Closure"
];
final stages = [
  "Initial",
  "Match",
  "Proposal",
  "Site Visit",
  "Booking Done",
  "Closure"
];
final busniessEntityTypes = [
  'Partnership',
  'Proprietorship',
  'LLP',
  'Private Limited'
];
final leadActivityTypes = [
  'site_visit',
  'call_log',
  'property_matched',
  'added_note'
];
final unitTypeFilters = [
  '1 BHK',
  '2 BHK',
  '2.5 BHK',
  '3 BHK',
  '3.5 BHK',
  '4 BHK',
  '4+ BHK',
];

final possessionByTimes = [
  'Ready to move in',
  'In 3 months',
  'In 6 months',
  'In 9 months',
  'In a year',
  'In 2 years'
];

const Map<String, int> postLeadActivity = {
  "Incoming": 21,
  "Outgoing": 22,
  "Missed": 20,
  "comment": 19
};

final String userNotification = "user_notification";
final String teamNotification = "team_announcement";
final String chatNotification = "chat_notification";

const Map<String, String> channelTitle = {
  "user_notification": "User Notificataion",
  "team_announcement": "Team Announcement",
  "chat_notification": "Chat Notification"
};

const Map<String, String> channelDescription = {
  "user_notification":
  "This channel is used for user related important notifications.",
  "team_announcement":
  "This channel is used for all low priority organization notifications.",
  "chat_notification": "This channel is used for chat related notifications."
};

final String leadTagChipTextColourOpacityInHex = 'FF';
final String leadTagChipBackgroundColourOpacityInHex = '1A';
final String leadTagChipBorderColourOpacityInHex = '1A';
final String leadTagChipCheckmarkColourOpacityInHex = 'FF';

enum SiteVisitType { Schedule, Reschedule }

const svScheduledKey = "site_visit_scheduled";
const svRescheduledKey = "site_visit_rescheduled";
const svCancelledKey = "site_visit_cancelled";
const svDoneKey = "site_visit_done";
const incomingCallKey = "incoming_call";
const projectMarkedFav = "project_marked_fav";
const projectUnMarkedFav = "project_unmarked_fav";
const leadLogin = "lead_portal_login";
const outgoingCallKey = "outgoing_call";
const missedCallKey = "missed_call";
const leadAddedKey = "lead_added";
const leadFollowUpKey = "added_lead_followup";
const commentKey = "comment";
const requirementAddedKey = "requirement_added";
const requirementUpdatedKey = "requirement_updated";
const bookingAddedKey = "booking_added";
const bookingUpdateKey = "booking_updated";
const bookingCancelledKey = "booking_cancelled";
const closureAddedKey = "closure_added";
const closureUpdateKey = "closure_updated";
const projectMatchedKey = "project_matched";
const projectProposedKey = "project_proposed";
const projectRemovedKey = "project_match_removed";
const tagAdded = "tags_added";
const tagRemoved = "tags_removed";
const status = "Status";
const stage = "Stage";
const misc = "Misc";

enum ImagePreviewKey { Gallery, Floorplan }

enum BookingClosure { Booking, Closure }

enum FilterScreen { Lead, Project }

enum LinkType { Email, Phone, SMS }

enum RoomType { Organization, Lead, RecentChats }

final siteVisit = ['Site Visit Scheduled', 'Unscheduled'];
final underConstructionTime = ['In 3 months', 'In 6 months', 'In a year'];
final siteVisitTime = ['Today', 'This week', 'Custom date range'];

final socialMediaLinkTypes = ['Facebook', 'Instagram', 'Youtube', 'Vimeo'];
final projectFilters = ['Favorite', 'Tied-up', 'Trending'];
final sources = {
  "Others": [
    "Website",
    "Email Marketing",
    "SMS Marketing",
    "Outbound Calls",
    "Inbound Calls",
    "Referrals",
    "Channel Partners"
  ],
  "Ads": ["Google Ads", "Youtube Ads"],
  "Social Media": ["Instagram", "Facebook", "LinkedIn", "Twitter", "Quora"],
  "Media": ["Print - NewsPapers, Magazines, Pamplets", "TV", "Radio"],
  "Marketplaces/Listing Portals": [
    "99acres",
    "MagicBricks",
    "Housing",
    "Makaan",
    "PropTiger",
    "CommonFloor",
    "OLX",
    "Quikr",
    "Sulekha"
  ]
};

final leadSources = [
  "Website",
  "Email Marketing",
  "SMS Marketing",
  "Outbound Calls",
  "Inbound Calls",
  "Referrals",
  "Google Ads",
  "Youtube Ads",
  "Instagram",
  "Facebook",
  "LinkedIn",
  "Twitter",
  "Quora",
  "TV",
  "Radio",
  "99acres",
  "MagicBricks",
  "Housing",
  "Makaan",
  "PropTiger",
  "CommonFloor",
  "OLX",
  "Quikr",
  "Sulekha",
  "Channel Partners",
  "others"
];

final matches = [
  'Recommended',
  'Premium',
  'New',
];
final possesionFilterOptions = ["Any", "Specific"];
final propertyTypeFilter = ["Apartment", "Villa", "Plot"];
final navItemLeads = "Leads";
final navItemProjects = "Projects";
final navItemChat = "Chats";
final navItemCalendar = "Calendar";
final navItemMore = "More";
const GlobalScreenPadding = EdgeInsets.all(10);
final answers = ['Yes', 'No'];

final String url =
    'https://realiq-dev.s3.ap-south-1.amazonaws.com/media/finsbury_regent.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAU7YIJDMEOY2SAZFL%2F20200810%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20200810T013334Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=bf14f35ade3a6af08fb38a44b9decae6ba43d67a61ff021c15304257f7a0d8b5';

final kGoogleApiKey = "AIzaSyBLtY2WdPzomHO6_P1BbWhjy6VatFrH1zc";

//"AIzaSyBpXmF-GVuOyweLK1-0k-Dswhs-Yj4PoIg";
enum LayAlignmentType { Horizontal, Vertical }

enum PropertyType { All, Apartment, Villa, Plot }

enum PossesionType { readyToMove, underConstruction }

enum PurchasePurpose { living, investment }

final addUnitTypes = [
  '1 BHK',
  '1.5 BHK',
  '2 BHK',
  '2.5 BHK',
  '3 BHK',
  '3.5 BHK',
  '4 BHK',
  '4+ BHK',
];
final possesionTypes = [
  "Ready to move in",
  "In 3 months",
  "In 6 months",
  "In a year"
];
List<String> dimensionsList = ['20 x 30', '30 x 40', '40 x 50', '50 x 60'];
String emptyRequirementDescription =
    "You’ve not added any requirements yet. Please add requirements before matching properties.";
String emptyPropertyMatchDescription =
    "You’ve not added any properties yet. Please go ahead and add properties matching lead’s requirements";
const ALTERNATE_REQUIREMENT_DESCRIPTION =
    'Does your lead have any alternate requirement? If so you can add alternate requirements';

// List<Property<PropertyType>> properties = [
//   Property(PropertyType.Apartment, 'Apartment'),
//   Property(PropertyType.Villa, 'Villa'),
//   Property(PropertyType.Plot, 'Plot'),
// ];
// List<Property<PossesionType>> possessions = [
//   Property(PossesionType.readyToMove, 'Ready to move in'),
//   Property(PossesionType.underConstruction, 'Under Construction'),
// ];
final Map<PossesionType, String> posessions = {
  PossesionType.readyToMove: 'Ready to move in',
  PossesionType.underConstruction: 'Under Construction'
};
// List<Property<PurchasePurpose>> purpose = [
//   Property(PurchasePurpose.living, 'Living'),
//   Property(PurchasePurpose.investment, 'Investment'),
// ];
final invalidRequirementText =
    "Please add all the required details before Saving";
final squareFeetUnit = 'sq.ft';
final inrUnit = 'INR';
final rupeeSymbol = '₹';

// Spacing constants
const spacingMicro = 2.0;
const spacingNano = 4.0;
const spacingMini = 6.0;
const spacingSmall = 8.0;
const spacingMedium = 12.0;
const spacingBase = 16.0;
const spacingLoose = 24.0;
const spacingAlone = 32.0;

const riqButtonFontSize = 14.0;
const riqButtonFontWeight = FontWeight.w700;

const riqAlertDialogCancel = "CANCEL";
const riqAlertDialogExit = "EXIT";
const riqAlertDialogNo = "NO";
const riqAlertDialogYes = "YES";

final plotKey = 'plot';
final villaKey = 'villa';
final amenities = [
  'Swimming pool',
  'Intercom',
  'Gated security',
  'Wifi connectivity',
  'Vastu complaints',
  'Parking',
  'Yoga zone',
  'Children play area',
];

final additionalFilters = [
  'New Properties',
  'Upcoming properties',
  'Properties with offers',
  'High demand properties',
];

// Notification channels
final followupNotificationChannel = NotificationChannel(
    'RIQ_Followups', 'Follow-ups', 'Notifications for lead follow-ups');

// Lead Activity

// Lead
final String otherSourceText = 'Others';
final String channelPartnerSourceText = 'Channel Partner';

// Chat
const chatListItemAvatarSize = 48.0;
const chatMessageMaxWidth = 300.0;
