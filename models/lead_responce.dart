import 'dart:convert';
import 'lead.dart';

LeadResponse leadResponseFromJson(dynamic jsonObj) =>
    LeadResponse.fromJson(jsonObj);

String leadResponseToJson(LeadResponse response) => json.encode(response);

class LeadResponse {
  int count;
  String next;
  dynamic previous;
  List<Lead>? results;

  LeadResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory LeadResponse.fromJson(Map<String, dynamic> json) => LeadResponse(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Lead>.from(json["results"].map((x) => Lead.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),  // List toJsonObject
  };
}