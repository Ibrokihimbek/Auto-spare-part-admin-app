import 'package:admin_aplication/data/models/product_model.dart';
import 'package:admin_aplication/screens/app_router.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/utils/app_images.dart';
import 'package:admin_aplication/view_model/product_view_model.dart';
import 'package:admin_aplication/widgets/button_large.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ShowProductPage extends StatefulWidget {
  const ShowProductPage({super.key});

  @override
  State<ShowProductPage> createState() => _ShowProductPageState();
}

class _ShowProductPageState extends State<ShowProductPage> {
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
        body: Consumer<ProductViewModel>(
          builder: ((context, productViewModel, child) {
            return Column(
              children: [
                SizedBox(
                  height: 700.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: productViewModel.productsAdmin.length,
                    itemBuilder: (context, index) {
                      return productItem(
                        productViewModel.productsAdmin[index],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12).r,
                  child: buttonLargeWidget(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.addProduct);
                      },
                      buttonName: 'Add Product'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget productItem(ProductModel model) {
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
              child: Image.network(
                model.productImages[0],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            SizedBox(
              width: 180.w,
              child: Text(
                model.productName,
                style: fontPoppinsW500(appcolor: AppColors.white),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.updateProduct,
                    arguments: {'productItem': model});
              },
              child: SvgPicture.asset(AppImages.icon_edit),
            ),
            SizedBox(width: 12.w),
            InkWell(
              onTap: () {
                context.read<ProductViewModel>().deleteProduct(model.productId);
              },
              child: SvgPicture.asset(AppImages.icon_delete),
            ),
          ],
        ),
      ),
    );
  }
}
