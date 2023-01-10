import 'package:admin_aplication/screens/app_router.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/utils/app_images.dart';
import 'package:admin_aplication/view_model/info_view_model.dart';
import 'package:admin_aplication/widgets/button_large.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'widgets/info_item.dart';

class InfoStorePage extends StatelessWidget {
  const InfoStorePage({super.key});

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
        body: SafeArea(
          child: Consumer<InfoViewModel>(
            builder: (contex, viewModel, child) {
              var infoStore = viewModel.information.first;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    infoStoreItem(
                      title: 'Sotuvchining ismi:',
                      subtitle: infoStore.sellerName,
                    ),
                    SizedBox(height: 8.h),
                    infoStoreItem(
                      title: 'telefon raqami:',
                      subtitle: infoStore.sellerPhoneNumber,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Do'kon haqida ma'lumot:",
                      style: fontPoppinsW400(
                        appcolor: AppColors.C_FFC567,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        infoStore.infoStore,
                        style: fontPoppinsW400(
                          appcolor: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Do'kon manzili:",
                      style: fontPoppinsW400(
                        appcolor: AppColors.C_FFC567,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Manzilni kartadan ko'rish:",
                          style: fontPoppinsW400(
                            appcolor: AppColors.C_FFC567,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 30.w,
                            height: 30.h,
                            child: SvgPicture.asset(
                              AppImages.icon_location,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    buttonLargeWidget(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.addInfo);
                        },
                        buttonName: "Do'kon haqida ma'lumot qo'shish"),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
