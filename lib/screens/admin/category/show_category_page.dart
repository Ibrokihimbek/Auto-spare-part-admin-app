import 'package:admin_aplication/data/models/category_model.dart';
import 'package:admin_aplication/screens/app_router.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/utils/app_images.dart';
import 'package:admin_aplication/view_model/category_view_model.dart';
import 'package:admin_aplication/widgets/button_large.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ShowCategoryPage extends StatefulWidget {
  const ShowCategoryPage({super.key});

  @override
  State<ShowCategoryPage> createState() => _ShowCategoryPageState();
}

class _ShowCategoryPageState extends State<ShowCategoryPage> {
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
        body: Consumer<CategoryViewModel>(
          builder: ((context, categoryViewModel, child) {
            return Column(
              children: [
                SizedBox(
                  height: 700.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: categoryViewModel.categories.length,
                    itemBuilder: (context, index) {
                      return categoryItem(
                        categoryViewModel.categories[index],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12).r,
                  child: buttonLargeWidget(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.addCategory);
                      },
                      buttonName: 'Add Catigory'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget categoryItem(CategoryModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6).r,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.C_FAFAFA.withOpacity(0.50),
        ),
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(width: 8.w),
            SizedBox(
              width: 80.w,
              height: 80.h,
              child: model.imageUrl.isEmpty
                  ? Image.asset(AppImages.image_car)
                  : Image.network(
                      model.imageUrl,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(width: 12.w),
            SizedBox(
              width: 180.w,
              child: Text(
                model.categoryName,
                style: fontPoppinsW500(appcolor: AppColors.white),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.updateCategory,
                    arguments: {'categoryItem': model});
              },
              child: SvgPicture.asset(AppImages.icon_edit),
            ),
            SizedBox(width: 12.w),
            InkWell(
              onTap: () {
                Provider.of<CategoryViewModel>(
                  context,
                  listen: false,
                ).deleteCategory(model.categoryId);
              },
              child: SvgPicture.asset(AppImages.icon_delete),
            ),
          ],
        ),
      ),
    );
  }
}
