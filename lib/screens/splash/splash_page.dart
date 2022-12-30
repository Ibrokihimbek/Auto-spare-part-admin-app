import 'package:admin_aplication/screens/app_router.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/utils/app_images.dart';
import 'package:admin_aplication/utils/app_lotties.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    onNextPage();
  }

  onNextPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteName.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.C_3E424B,
            AppColors.C_363941.withOpacity(0.100),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 250.h),
              SizedBox(
                width: 100.w,
                height: 100.w,
                child: Image.asset(AppImages.image_car),
              ),
              SizedBox(height: 16.h),
              Text(
                'Car Spare Part',
                style: fontPoppins700(appcolor: AppColors.white)
                    .copyWith(fontSize: 27.sp),
              ),
              SizedBox(height: 300.h),
              SizedBox(
                width: 50.w,
                height: 50.h,
                child: Lottie.asset(AppLotties.lottie_loading),
              )
            ],
          ),
        ),
      ),
    );
  }
}
