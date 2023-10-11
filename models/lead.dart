import 'dart:convert';

Lead leadFromJson(dynamic jsonObj) => Lead.fromJson(jsonObj);
List<Lead> leadsFromJson(dynamic jsonArray) => List.from(jsonArray.map((x) => Lead.fromJson(jsonArray)));
String leadToJson(Lead lead) => json.encode(lead);
String leadToJsonList(List<Lead>leads) => json.encode(leads);

class Lead {
  int? id;
  String name;
  String? mobile;
  String? altMobile;  //data may be null
  String? email;
  String? stage;
  bool favorite;
  dynamic? campaign;
  dynamic? leadSource;
  bool? inactive;
  bool junk;
  int? projectProposalCount;
  int? projectMatchCount;
  int? siteVisitScheduledCount;
  int? siteVisitDoneCount;
  int? owner;
  String? ownerName;
  bool leadNew;
  int? createdBy;
  int? agency;
  DateTime? createdTs;
  DateTime? modifiedTs;
  String? notes;

  Lead({
    this.id,
    required this.name,
    required this.mobile,
    required this.altMobile,
    required this.email,
    this.stage,
    required this.favorite,
    required this.campaign,
    required this.leadSource,
    required this.inactive,
    required this.junk,
    this.projectProposalCount,
    this.projectMatchCount,
    this.siteVisitScheduledCount,
    this.siteVisitDoneCount,
    required this.owner,
    this.ownerName,
    required this.leadNew,
    this.createdBy,
    this.agency,
    this.createdTs,
    this.modifiedTs,
    required this.notes,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    altMobile: json["alt_mobile"],
    email: json["email"],
    stage: json["stage"],
    favorite: json["favorite"],
    campaign: json["campaign"],
    leadSource: json["lead_source"],
    inactive: json["inactive"],
    junk: json["junk"],
    projectProposalCount: json["project_proposal_count"],
    projectMatchCount: json["project_match_count"],
    siteVisitScheduledCount: json["site_visit_scheduled_count"],
    siteVisitDoneCount: json["site_visit_done_count"],
    owner: json["owner"],
    ownerName: json["owner_name"],
    leadNew: json["new"],
    createdBy: json["created_by"],
    agency: json["agency"],
    createdTs: DateTime.parse(json["created_ts"]),
    modifiedTs: DateTime.parse(json["modified_ts"]),
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "alt_mobile": altMobile,
    "email": email,
    "stage": stage,
    "favorite": favorite,
    "campaign": campaign,
    "lead_source": leadSource,
    "inactive": inactive,
    "junk": junk,
    "project_proposal_count": projectProposalCount,
    "project_match_count": projectMatchCount,
    "site_visit_scheduled_count": siteVisitScheduledCount,
    "site_visit_done_count": siteVisitDoneCount,
    "owner": owner,
    "owner_name": ownerName,
    "new": leadNew,
    "created_by": createdBy,
    "agency": agency,
    "created_ts": createdTs,
    "modified_ts": modifiedTs,
    "notes": notes,
  };
}

