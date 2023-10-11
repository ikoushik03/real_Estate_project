import 'dart:convert';
import 'package:http/http.dart' as http;

const BASE_URL = "http://192.168.1.114:8000/api/v1/";
// const BASE_URL = "http://72.194.180.118:8013/";

class RemoteService {
  // var headers = {"Accept": "gzip"};

  RemoteService() {
    // headers["Authorization"] = "";
    // headers["Content-Type"] = "application/json";
  }

  Future<ApiResponse<T>> getAsync<T>(
      String endPoint,
      Map<String, String>? headers,
      T Function(dynamic)? fromJson,
      ) async {
    var client = http.Client();
    var uri = Uri.parse("$BASE_URL$endPoint");
    var response = await client.get(uri, headers: headers);
    return handleResponse(response, fromJson);
  }

  Future<ApiResponse<T>> postAsync<T>(
      String endPoint,
      Map<String, String>? headers,
      dynamic object,
      T Function(dynamic)? fromJson,
      ) async {
    var jsonObj = jsonEncode(object);
    // headers["Content-Length"] = jsonObj.length.toString();

    var client = http.Client();
    var uri = Uri.parse("$BASE_URL$endPoint");
    var response = await client.post(uri, headers: headers, body: jsonObj);
    return handleResponse(response, fromJson);
  }

  Future<ApiResponse<T>> postAsyncWithFormData<T>(
      String endPoint,
      Map<String, String>? headers,
      Map<String, String> formData,
      T Function(dynamic)? fromJson) async {
    // headers["Content-Length"] = formData
    //     .toString()
    //     .length
    //     .toString();

    var client = http.Client();
    var uri = Uri.parse("$BASE_URL$endPoint");
    var response = await client.post(uri, headers: headers, body: formData);
    return handleResponse(response, fromJson);
  }

  Future<ApiResponse<T>> putAsync<T>(
      String endPoint,
      Map<String, String>? headers,
      dynamic object,
      T Function(dynamic)? fromJson) async {
    var jsonObj = jsonEncode(object);
    // headers["Content-Length"] = jsonObj.length.toString();

    var client = http.Client();
    var uri = Uri.parse("$BASE_URL$endPoint");
    var response = await client.put(uri, headers: headers, body: jsonObj);
    return handleResponse(response, fromJson);
  }

  Future<ApiResponse<T>> deleteAsync<T>(
      String endPoint,
      Map<String, String>? headers,
      dynamic object,
      T Function(dynamic)? fromJson) async {
    var client = http.Client();
    var uri = Uri.parse("$BASE_URL$endPoint");
    var response = await client.delete(uri, headers: headers);
    return handleResponse(response, fromJson);
  }

  ApiResponse<T> handleResponse<T>(
      http.Response response, T Function(dynamic)? fromJson) {
    print("HTTP Status Code = ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonStr = response.body;
      var jsonObj = jsonDecode(jsonStr);

      dynamic obj;
      if (fromJson != null) {
        obj = fromJson(jsonObj);
      }

      return ApiResponse<T>.success(
          message: "Data Fetched Successfully", data: obj);
    } else if (response.statusCode == 204) {
      return ApiResponse<T>.success(message: "Data Fetched Successfully");
    }
    return ApiResponse<T>.error(message: "Error in Response");
  }
}

class ApiResponse<T> {
  bool? isSuccess;
  String? message;
  T? data;

  ApiResponse({
    this.isSuccess,
    this.message,
    this.data,
  });

  factory ApiResponse.success({
    required String message,
    T? data,
  }) =>
      ApiResponse<T>(
        isSuccess: true,
        message: message,
        data: data,
      );

  factory ApiResponse.error({
    required String message,
    T? data,
  }) =>
      ApiResponse<T>(
        isSuccess: false,
        message: message,
        data: data,
      );

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) create,
      ) {

    return ApiResponse<T>(
      isSuccess: json["isSuccess"],
      message: json["message"],
      data: json["data"] != null ? create(json["data"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "isSuccess": this.isSuccess,
    "message": this.message,
    "data": json.encode(this.data),
  };
}
