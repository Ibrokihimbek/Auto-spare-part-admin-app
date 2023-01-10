import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:flutter/material.dart';

Widget infoStoreItem({
    required String title,
    required String subtitle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: fontPoppinsW400(
            appcolor: AppColors.C_FFC567,
          ),
        ),
        Text(
          subtitle,
          style: fontPoppinsW400(
            appcolor: AppColors.white,
          ),
        ),
      ],
    );
  }