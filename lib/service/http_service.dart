// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart';

import '../model/posts_model.dart';
import 'log_service.dart';



class Network {
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {'Content-Type': 'application/json'};
  /* Http Apis*/
  static String API_LIST = "/posts";
  static String API_GET = "/posts/";
  static String API_CREATE = "/posts/";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

  /* Http Requests*/
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 202) {
      return response.body;
    }
    return null;
  }
  static Map<String, dynamic> paramsCreate(Posts posts) {
    Map<String, dynamic> params = {};
    params.addAll({
      'title': posts.title ,
      'body': posts.body.toString(),
      'id': posts.id.toString(),
    });
    return params;
  }

  static Map<String, dynamic> paramsUpdate(Posts posts) {
    Map<String, dynamic> params = {};
    params.addAll({
      'name': posts.title.toString() ,
      'body': posts.body.toString(),
      'id': posts.id.toString(),
    });
    return params;
  }

  static Future<String?> DEL(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    LogService.e("Api: "+ BASE + api);
    LogService.w("Params: "+params.toString ());
    LogService.d("Response: "+response.body);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }





/* Http Response*/
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }





/* Http Parsing*/
  static List<Posts> parsecPostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Posts>.from(json.map((x) => Posts.fromJson(x)));
    return data;
  }
}
