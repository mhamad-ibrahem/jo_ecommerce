import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/colors/app_colors.dart';

AppBar customAppBar(
    {required String title,
    required BuildContext context,
    SystemUiOverlayStyle? systemOverlayStyle,
    List<Widget>? actions,
    bool isBack=true,
    }) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    centerTitle: true,
    backgroundColor: Colors.black,
    elevation: 0,
    title: Text(
      title,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: 18.sp,
          ),
    ),
    leading:isBack? IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors().black,
        )):null,
    actions: actions,
  );
}
