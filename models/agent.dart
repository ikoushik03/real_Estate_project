

import '../config/responce_keys.dart';

class Agent {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? photo;
  String? type;
  int? organization;

  Agent(
      {this.id,
        this.name,
        this.mobile,
        this.email,
        this.photo,
        this.type,
        this.organization});

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
        id: json[ResponseKeys.id],
        name: json[ResponseKeys.name],
        mobile: json[ResponseKeys.mobile],
        email: json[ResponseKeys.email],
        photo: json[ResponseKeys.photo],
        type: json[ResponseKeys.type],
        organization: json[ResponseKeys.organization]);
  }
}
