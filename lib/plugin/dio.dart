import 'dart:io';

import 'package:dio/dio.dart';

Dio http = Dio(BaseOptions(connectTimeout: 30000, responseType: ResponseType.json, contentType: ContentType.json.toString()))
  ..interceptors.addAll([
    InterceptorsWrapper(onRequest: (RequestOptions requestOptions) async {
      print(123131313);
      print(requestOptions.uri);
      return requestOptions;
    }, onResponse: (Response response) async {
      return response; // continue
    }, onError: (DioError error) async {
      if (error is Exception) {
        try {
          if (error is DioError) {
            print(error.type);
            switch (error.type) {
              case DioErrorType.CANCEL:
                print('requestCancelled');
                break;
              case DioErrorType.CONNECT_TIMEOUT:
                print('requestTimeout');
                break;
              case DioErrorType.DEFAULT:
                print('noInternetConnection');
                break;
              case DioErrorType.RECEIVE_TIMEOUT:
                print('sendTimeout');
                break;
              case DioErrorType.RESPONSE:
                print('response error');
                print(error.response);
                switch (error.response?.statusCode) {
                  case 400:
                    break;
                  case 401:
                    print('401');
                    break;
                  case 403:
                    break;
                  case 404:
                    break;
                  case 405:
                    break;
                  default:
                    break;
                }
                break;
              case DioErrorType.SEND_TIMEOUT:
                break;
            }
          } else if (error is SocketException) {
          } else {}
        } on FormatException catch (e) {
          print(e);
        } catch (e) {
          print(e);
        }
      }
      return error; //continue
    })
  ]);
