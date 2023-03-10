import 'package:admin_aplication/data/models/latlong/lat_long.dart';
import 'package:admin_aplication/screens/admin/widgets/button_widget.dart';
import 'package:admin_aplication/screens/app_router.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'info_store/lat_long/lat_long.dart';

class AdminPage extends StatelessWidget {
  LatLong latLong;
  AdminPage({super.key, required this.latLong});

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonWidgetbyHomrOrAdmin(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.showCategory);
                    },
                    buttonName: 'Kategoriyalar'),
                SizedBox(height: 12.h),
                buttonWidgetbyHomrOrAdmin(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.showProduct);
                    },
                    buttonName: 'Mahsulotlar'),
                SizedBox(height: 12.h),
                buttonWidgetbyHomrOrAdmin(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.allUsers);
                    },
                    buttonName: 'Foydalanuvchilar'),
                SizedBox(height: 12.h),
                buttonWidgetbyHomrOrAdmin(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.infoStore, arguments: latLong);
                    },
                    buttonName: "Do'kon haqida ma'lumot"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
