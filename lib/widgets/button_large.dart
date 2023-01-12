import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buttonLargeWidget({required VoidCallback onTap, required String buttonName}) {
  return InkWell(
    borderRadius: BorderRadius.circular(15.r),
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF373737),
          ),
        ],
        gradient: LinearGradient(
          colors: [
            AppColors.C_393B40.withOpacity(0.30),
            AppColors.C_FAFAFA.withOpacity(0.50),
            AppColors.C_393B40.withOpacity(0.30),
          ],
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Center(
        child: SizedBox(
          width: 200.w,
          child: Text(
            buttonName,
            textAlign: TextAlign.center,
            style: fontPoppinsW500(appcolor: AppColors.white),
          ),
        ),
      ),
    ),
  );
}
