import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration getInputDecoration({required String label}) {
  return InputDecoration(
    labelText: label,
    labelStyle: fontPoppinsW400(
      appcolor: AppColors.white.withOpacity(0.5),
    ).copyWith(fontSize: 16.sp),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.r),
      ),
      borderSide: const BorderSide(
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.white)),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.white)),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.white)),
  );
}

InputDecoration getInputDecorationByPassword(
    {required String label, required VoidCallback onTap, required bool isPas}) {
  return InputDecoration(
    suffixIcon: InkWell(
      onTap: onTap,
      child: Icon(isPas ? Icons.visibility_off : Icons.visibility,
          color: AppColors.white),
    ),
    labelText: label,
    labelStyle:
        fontPoppinsW400(appcolor: AppColors.white).copyWith(fontSize: 16.sp),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.white)),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.white)),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.white)),
  );
}
