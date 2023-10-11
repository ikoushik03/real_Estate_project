
import 'dart:convert';

import 'package:real_estate_project/models/project.dart';

ProjectResponce projectResponseFromJson(dynamic jsonObj) =>
    ProjectResponce.fromJson(jsonObj);

String projectResponseToJson(ProjectResponce response) => json.encode(response);
//realiqResponseFromJson(json));
class ProjectResponce {
  int count;
  String next;
  dynamic previous;
  List<Project?> results;


  ProjectResponce({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,

  });

  factory ProjectResponce.fromJson(Map<String, dynamic> json) => ProjectResponce(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Project>.from(json["results"].map((x) => Project.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results!.map((x) => x?.toJson())),  // List toJsonObject
  };
}
