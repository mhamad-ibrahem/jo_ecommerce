import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.icon,
    this.hint,
    this.obscure = false,
    this.textEditingController,
    this.validator,
    this.inputType,
    this.suffixIcon,
    this.onChange,
    this.onTap,
    this.focusNode,
    this.numberOfLines,
    this.isEnable = true,
    this.onFieldSubmitted,
    this.isReadOnly = false,
    this.isField = false,
    this.onLeadingTap, this.fillColor, this.radius, this.contentPadding,this.isRegister=false,
  }) : super(key: key);
  final Widget? icon;
  final String? hint;
  final bool obscure;
  final TextInputType? inputType;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final void Function(String)? onChange;
  final int? numberOfLines;
  final void Function()? onTap;
  final void Function()? onLeadingTap;
  final FocusNode? focusNode;
  final bool isEnable;
  final void Function(String)? onFieldSubmitted;
  final bool isReadOnly;
  final bool isField;
  final Color? fillColor;
  final double? radius;
 final EdgeInsetsGeometry? contentPadding;
 final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color:isRegister? AppColors.primaryColor: AppColors().white,
            fontSize: 15.sp,
          ),
      obscureText: obscure,
      enabled: isEnable,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      readOnly: isReadOnly,
      maxLines: numberOfLines ?? 1,
      cursorColor:isRegister? AppColors.primaryColor: AppColors().white,
      keyboardType: inputType,
      decoration: InputDecoration(
          fillColor:fillColor?? AppColors().grey,
          enabled: isEnable,
          filled: isField,
          suffixIcon: suffixIcon,
          prefixIcon:icon !=null?Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: onLeadingTap,
              child: icon,
            ),
          ):null,
          contentPadding:contentPadding??
              const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color:isRegister? AppColors.primaryColor: AppColors().white,fontSize: 12.sp),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
          disabledBorder: UnderlineInputBorder(borderSide:BorderSide(color:isRegister? AppColors.primaryColor: AppColors().white.withOpacity(0.7))),
          errorBorder:  UnderlineInputBorder(borderSide: BorderSide(color: AppColors().red)),
          border:  UnderlineInputBorder(borderSide:BorderSide(color:isRegister? AppColors.primaryColor: AppColors().white.withOpacity(0.7))),
          enabledBorder:  UnderlineInputBorder(borderSide: BorderSide(color:isRegister? AppColors.primaryColor: AppColors().white.withOpacity(0.7)))
          ),
    );
  }
}
