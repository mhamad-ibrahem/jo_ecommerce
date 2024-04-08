import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../app/local_storage/get_storage.dart';
import '../constant/local_storage_box/local_storage_box.dart';
import '../localization/controller/localization_controller.dart';

class AppServices extends GetxService {
  //i use it for initialize all data i need instead of initialize it in the main function
  static String accessToken = '';
  static String fcmToken = '';
  static String userId = ''; //this the user client id
  static String userRole = '';
  static String refreshToken = '';
  static String userEmail = '';
  static String userPassword = '';
  static LocalizationController? localizationController;
  Future<AppServices> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    localizationController = await Get.put(LocalizationController());
    accessToken = await GetStorageClass.getString(LocalStorageBox.token);
    userId = await GetStorageClass.getString(LocalStorageBox.userId);
    userRole = await GetStorageClass.getString(LocalStorageBox.userRole);
    userEmail = await GetStorageClass.getString(LocalStorageBox.userEmail);
    userPassword =
        await GetStorageClass.getString(LocalStorageBox.userPassword);
    refreshToken =
        await GetStorageClass.getString(LocalStorageBox.refreshToken);
    log("token is :  $accessToken");
    debugPrint("user id is $userId  user role $userRole");
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
