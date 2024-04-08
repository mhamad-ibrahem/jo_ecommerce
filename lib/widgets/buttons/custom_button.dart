import 'package:flutter/material.dart';
import '../../core/constant/colors/app_colors.dart';
import '../../core/constant/size/app_size.dart';
import '../../shared/widgets/loading/loading_points.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonBody,
    required this.onTap,
    this.buttonWidth,
    this.height,
    this.isReverseColor = false,
    this.isLoading = false,
    this.buttonColor,
    this.radius,
    this.child,
    this.textColor,
    this.padding, 
  }) : super(key: key);
  final double? buttonWidth;
  final VoidCallback? onTap;
  final String buttonBody;
  final double? height;
  final double? radius;
  final bool isReverseColor;
  final bool isLoading;
  final Color? buttonColor;
  final Color? textColor;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
        padding: padding ?? const EdgeInsets.all(0),
        onPressed: onTap,
        minWidth:buttonWidth?? AppSize.screenWidth(context: context) * 0.8,
        color: isReverseColor == true
            ? AppColors().white
            : buttonColor ?? AppColors.primaryColor,
        disabledColor: AppColors().grey,
        disabledTextColor: AppColors().black,
        height: height ?? 50,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(radius ?? AppSize.appCustomRadius),
            side: isReverseColor == true
                ? const BorderSide(color: AppColors.primaryColor)
                : BorderSide(color: buttonColor ?? AppColors.primaryColor)),
        child: SizedBox(
          width: buttonWidth ?? AppSize.screenWidth(context: context) * 0.8,
          child: child ??
              Center(
                child: isLoading == false
                    ? Text(
                        buttonBody,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                              color: AppColors().white,
                              fontSize: 16,
                            )
                            .copyWith(
                                color: isReverseColor == true
                                    ? AppColors.primaryColor
                                    : textColor ?? AppColors().white),
                      )
                    : LoadingPoint(
                        color: isReverseColor ? AppColors.primaryColor : null,
                      ),
              ),
        ),
    );
  }
}
