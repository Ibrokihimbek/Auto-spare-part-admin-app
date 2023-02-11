import 'package:admin_aplication/screens/admin/info_store/lat_long/lat_long.dart';
import 'package:admin_aplication/screens/app_router.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/utils/app_images.dart';
import 'package:admin_aplication/utils/app_lotties.dart';
import 'package:admin_aplication/view_model/info_view_model.dart';
import 'package:admin_aplication/widgets/button_large.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
              if (viewModel.information.isNotEmpty) {
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
                      icon: AppImages.icon_profile),
                  SizedBox(height: 24.h),
                  infoStoreItem(
                    title: 'telefon raqami:',
                    subtitle: infoStore.sellerPhoneNumber,
                    icon: AppImages.icon_call,
                    onTap: () async {
                      final Uri phoneUri =
                          Uri(scheme: "tel", path: infoStore.sellerPhoneNumber);
                      try {
                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(phoneUri);
                        }
                      } catch (error) {
                        throw ("Cannot dial");
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  infoStoreItem(
                    title: "Do'kon manzili:",
                    subtitle: infoStore.address,
                    icon: AppImages.icon_home,
                  ),
                  SizedBox(height: 20.h),
                  infoStoreItem(
                    title: "Manzilni xaritadan ko'rish:",
                    subtitle: "Harita belgisiga bosing ➣",
                    onTap: () {
                      LatLong.openMap(
                        double.parse(infoStore.lat),
                        double.parse(infoStore.long),
                      );
                    },
                    icon: AppImages.icon_location,
                  ),
                  SizedBox(height: 24.h),
                  infoStoreItem(
                      title: "Do'kon haqida ma'lumot:",
                      subtitle: infoStore.infoStore,
                      icon: AppImages.icon_description),
                      SizedBox(height: 30.h),
                      buttonLargeWidget(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.updateInfo,
                            arguments: {
                              'infoModel': viewModel.information.first
                            },
                          );
                        },
                        buttonName: "Do'kon haqida ma'lumotni yangilash",
                      ),
                    ],
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 24,
                ).r,
                child: Column(
                  children: [
                    Center(
                      child: Lottie.asset(AppLotties.lottie_no_data),
                    ),
                    Text(
                      "Hali ma'lumot yo'q!",
                      textAlign: TextAlign.center,
                      style: fontPoppinsW500(appcolor: AppColors.white),
                    ),
                    const Spacer(),
                    buttonLargeWidget(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.addInfo);
                      },
                      buttonName: "Do'kon haqida ma'lumot qo'shish",
                    ),
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
