import 'dart:ui';

import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';




class DioHelper {
  static late Dio dio;


  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );

    addDioInterceptor();
    return Future.value();
  }


  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query ,
    String lang = 'en',
    String? token,

  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '' ,
    };

    return await dio.get(url, queryParameters: query??null,);
  }


  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
     String? token,

  }) async
  {
    print('pre_header');
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '' ,
    };
    print('post_header');

    return dio!.post(
      url,
      data: data,
      queryParameters: query,

    );

  }



  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,

  }) async
  {

    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '' ,
    };
    print('post_header');

    return dio!.put(
      url,
      data: data,
      queryParameters: query,

    );

  }

  static void addDioInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }

}



