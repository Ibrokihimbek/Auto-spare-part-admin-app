import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWidgets {
  static Widget logoWidget({required String image}) {
    return Center(
      child: SizedBox(
        width: 70.w,
        height: 70.h,
        child: Image.asset(image),
      ),
    );
  }

  static Widget textWidget({required String title, required String subTitle}) {
    return ListTile(
      title: Text(
        title,
        style: fontPoppinsW600(appcolor: AppColors.white)
            .copyWith(fontSize: 20.sp),
      ),
      subtitle: Text(
        subTitle,
        style: fontPoppinsW400(appcolor: AppColors.white)
            .copyWith(fontSize: 14.sp),
      ),
    );
  }

  static Widget buttonWidget(
      {required String buttonName, required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 64.h,
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
          child: Text(
            buttonName,
            style: fontPoppinsW600(appcolor: AppColors.white).copyWith(
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
