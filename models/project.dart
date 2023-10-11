import 'dart:convert';

Project projectFromJson(dynamic jsonObj) => Project.fromJson(jsonObj);
List<Project> projectsFromJson(dynamic jsonArray) =>
    List.from(jsonArray.map((x) => Project.fromJson(x)));
String projectToJson(Project project) => json.encode(project);
String projectToJsonList(List<Project> projects) => json.encode(projects);

class Project {
  int? id;
  String? addressLine1;
  String? addressLine2;
  String? landmark;
  String? city;
  String? region;
  String? postalCode;
  String? country;
  double? latitude;
  double? longitude;
  String mapLink;
  DateTime? createdTs;
  DateTime? modifiedTs;
  int? project;

  Project({
    required this.id,
    required this.addressLine1,
    required this.addressLine2,
    required this.landmark,
    required this.city,
    required this.region,
    required this.postalCode,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.mapLink,
    required this.createdTs,
    required this.modifiedTs,
    required this.project,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"],
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    landmark: json["landmark"],
    city: json["city"],
    region: json["region"],
    postalCode: json["postal_code"],
    country: json["country"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    mapLink: json["map_link"],
    createdTs: DateTime.parse(json["created_ts"]),
    modifiedTs: DateTime.parse(json["modified_ts"]),
    project: json["project"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "landmark": landmark,
    "city": city,
    "region": region,
    "postal_code": postalCode,
    "country": country,
    "latitude": latitude,
    "longitude": longitude,
    "map_link": mapLink,
    "created_ts": createdTs?.toIso8601String(),
    "modified_ts": modifiedTs?.toIso8601String(),
    "project": project,
  };
}
