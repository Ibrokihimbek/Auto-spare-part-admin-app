import 'package:admin_aplication/data/models/category_model.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/view_model/category_view_model.dart';
import 'package:admin_aplication/widgets/button_large.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:admin_aplication/widgets/input_decoration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateCategoryPage extends StatefulWidget {
  final CategoryModel categoryModel;
  const UpdateCategoryPage({super.key, required this.categoryModel});

  @override
  State<UpdateCategoryPage> createState() => _UpdateCategoryPageState();
}

class _UpdateCategoryPageState extends State<UpdateCategoryPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController updateCategoryCantroller =
      TextEditingController();
  final TextEditingController updateCategoryDescriptionCantroller =
      TextEditingController();

  @override
  void initState() {
    updateCategoryCantroller.text = widget.categoryModel.categoryName;
    updateCategoryDescriptionCantroller.text = widget.categoryModel.description;
    Provider.of<CategoryViewModel>(context, listen: false).listenCategories();
    super.initState();
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
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Consumer<CategoryViewModel>(
              builder: ((context, categoryViewModel, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                        'Mahsulot nomi yangilash',
                        style: fontPoppinsW400(appcolor: AppColors.white)
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: updateCategoryCantroller,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (category) =>
                            category != null && category.length < 6
                                ? "Mahsulot nomini 6 ta belgidan ko'p kiriting"
                                : null,
                        style: fontPoppinsW400(appcolor: AppColors.white),
                        decoration: getInputDecoration(label: ''),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        "Mahsulot haqida ma'lumotni yangilash",
                        style: fontPoppinsW400(appcolor: AppColors.white)
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        maxLines: 4,
                        controller: updateCategoryDescriptionCantroller,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (category) =>
                            category != null && category.length < 6
                                ? "Ma'lumotni 6 ta belgidan ko'p kiriting"
                                : null,
                        style: fontPoppinsW400(appcolor: AppColors.white),
                        decoration: getInputDecoration(label: ""),
                      ),
                      SizedBox(height: 30.h),
                      buttonLargeWidget(
                          onTap: () {
                            CategoryModel categoryModel = CategoryModel(
                              categoryId: "",
                              categoryName: updateCategoryCantroller.text,
                              description:
                                  updateCategoryDescriptionCantroller.text,
                              imageUrl:
                                  "https://freepngimg.com/thumb/refrigerator/5-2-refrigerator-png-picture-thumb.png",
                              createdAt: DateTime.now().toString(),
                            );

                            Provider.of<CategoryViewModel>(context,
                                    listen: false)
                                .addCategory(categoryModel);
                            Navigator.pop(context);
                          },
                          buttonName: 'Update Category'),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
