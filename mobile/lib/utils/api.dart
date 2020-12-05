import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:e_garden/application.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class API {
  static String baseUrl = "https://uetegarden.azurewebsites.net/";
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: 30000,
      sendTimeout: 60000,
      receiveTimeout: 30000,
      contentType: 'application/json; charset=utf-8',
      baseUrl: baseUrl,
    ),
  );

  API() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
//    dio.interceptors
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      Application.sharePreference.hasKey("token") ? options.headers["Authorization"] = "Bearer ${Application.sharePreference.getString("token")}" : {};
      Application.sharePreference.hasKey("userId") ? options.headers["Abp.userId"] = "${Application.sharePreference.getInt("userId")}" : {};
      print(options.uri);
      // print(options.data);
      // print(options.headers['Abp.userId']);
      // Do something before request is sent
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (Response response) async {
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) async {
      // Do something with response error
      handleTimeOutException(e.type);
      // Refresh Token
      print(e.message);
      if (e.response?.statusCode == 401) {
        Map<String, dynamic> data = <String, dynamic>{
          "refreshToken": await Application.sharePreference.getString("refreshToken"),
        };
        var response = await dio.post("/api/TokenAuth/RefreshToken", data: data);
        if (response.statusCode == 200) {
          var newAccessToken = response.data["data"]["accessToken"]; // get new access token from response
          Application.sharePreference.putString("accessToken", "$newAccessToken");
          return dio.request(e.request.baseUrl + e.request.path, options: e.request);
        }
      }
      return e.response; //continue
    }));
  }

  void handleTimeOutException(DioErrorType type) {
    switch (type) {
      case DioErrorType.CONNECT_TIMEOUT:
        Fluttertoast.showToast(
          msg: "Failed connect to server",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        break;
      case DioErrorType.SEND_TIMEOUT:
        Fluttertoast.showToast(
          msg: "Failed sending data to server",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        Fluttertoast.showToast(
          msg: "Failed receiving data from server",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        break;
      default:
        break;
    }
  }

  Future get(String url, [Map<String, dynamic> params]) async {
    return dio.get(url, queryParameters: params);
  }

  Future post(String url, Map<String, dynamic> params) async {
    return dio.post(url, data: params);
  }

  Future put(String url, [Map<String, dynamic> params]) async {
    return dio.put(url, data: params);
  }

  Future delete(String url, [Map<String, dynamic> params]) async {
    return dio.delete(url, queryParameters: params);
  }
}
