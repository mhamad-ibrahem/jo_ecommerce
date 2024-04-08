import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../core/constant/colors/app_colors.dart';


class LoadingPoint extends StatelessWidget {
  final Color? color;
  final double? size;
  const LoadingPoint({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color ?? AppColors().white,
      size: size ?? 12,
    );
  }
}
