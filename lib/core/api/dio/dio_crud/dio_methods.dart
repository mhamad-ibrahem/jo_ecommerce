import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../classes/dio_method.dart';
import '../../../classes/status_request.dart';
import '../../../helper/internet_functions/check_internet_connection.dart';
import '../../links/api_links.dart';
import '../errors/api_errors.dart';
import '../errors/dio_exceptions.dart';

Dio dio = Dio();

class DioMethods {
  Future<Either<ApiErrors, Map>> allMethod({
    required DioMethod dioMethod,
    required String linkUrl,
    Map? body,
    required bool isAuthorized,
    Map<String, List<File>>? files,
  }) async {
    try {
      log("url link is $linkUrl");
      if (await checkInternetConnection()) {
        final response = await chooseMethod(
          body: body,
          linkUrl: linkUrl,
          dioMethod: dioMethod,
          isAuthorized: isAuthorized,
          files: files,
          dio: dio,
        );
        Map responseBody = response.data;
        debugPrint("status code is ${response.statusCode}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(responseBody);
        } else {
          return left(ApiErrors(
              statusCode: response.statusCode,
              message: responseBody['Messages'][0],
              statusRequest: StatusRequest.failure));
        }
      } else {
        return left(ApiErrors(
            message: 'No internet connection',
            statusRequest: StatusRequest.failure));
      }
    } on SocketException catch (e) {
      log('No internet connection | $e');
      return Left(NetworkError(message: "No internet connection"));
    } on DioException catch (e) {
      log("Dio exception error $e");
      return left(DioExceptions.showDioExceptionMessage(dioException: e));
    }
  }

  Future<Either<ApiErrors, String>> allMethodStringResponse({
    required DioMethod dioMethod,
    required String linkUrl,
    Map? body,
    required bool isAuthorized,
    Map<String, List<File>>? files,
  }) async {
    try {
      log("url link is $linkUrl");
      if (await checkInternetConnection()) {
        final response = await chooseMethod(
          body: body,
          linkUrl: linkUrl,
          dioMethod: dioMethod,
          isAuthorized: isAuthorized,
          files: files,
          dio: dio,
        );
        String responseBody = response.data;
        debugPrint("status code is ${response.statusCode}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(responseBody);
        } else {
          return left(ApiErrors(
              statusCode: response.statusCode,
              message: responseBody,
              statusRequest: StatusRequest.failure));
        }
      } else {
        return left(ApiErrors(
            message: 'No internet connection',
            statusRequest: StatusRequest.failure));
      }
    } on SocketException catch (e) {
      log('No internet connection | $e');
      return Left(NetworkError(message: "No internet connection"));
    } on DioException catch (e) {
      log("Dio exception error $e");
      return left(DioExceptions.showDioExceptionMessage(dioException: e));
    }
  }

  static Future<Response<dynamic>> chooseMethod({
    required DioMethod dioMethod,
    required String linkUrl,
    Map? body,
    required bool isAuthorized,
    Map<String, List<File>>? files,
    required Dio dio,
  }) async {
    Options options = Options(
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header);
    //======POST==========================
    if (dioMethod == DioMethod.post) {
      return await dio.post(linkUrl, data: body, options: options);
    }
    //======DELETE==========================
     else if (dioMethod == DioMethod.delete) {
      return await dio.delete(linkUrl, data: body, options: options);
    }
    //======PATCH==========================
     else if (dioMethod == DioMethod.patch) {
      return await dio.patch(linkUrl, data: body, options: options);
    }
    //======PUT==========================
     else if (dioMethod == DioMethod.put) {
      return await dio.patch(linkUrl, data: body, options: options);
    } 
    //======MULTIPART==========================
    else if (dioMethod == DioMethod.multiPart) {
      final formData = files != null ? FormData.fromMap(files) : {};
      await dio.post(linkUrl, data: {
        body,
        formData,
      });
    }

    return await dio.get(linkUrl, options: options);
  }
}
