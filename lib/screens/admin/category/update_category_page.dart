import 'package:admin_aplication/data/models/category_model.dart';
import 'package:admin_aplication/data/service/file_uploader.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/utils/app_images.dart';
import 'package:admin_aplication/view_model/category_view_model.dart';
import 'package:admin_aplication/widgets/button_large.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:admin_aplication/widgets/input_decoration_widget.dart';
import 'package:admin_aplication/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
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

  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String imageUrl = '';
  bool isLoading = false;

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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
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
                          validator: (category) => category != null &&
                                  category.length < 6
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
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rasmini yangilash ➣',
                              style: fontPoppinsW400(appcolor: AppColors.white),
                            ),
                            imageUrl.isEmpty
                                ? SizedBox(
                                    width: 100.w,
                                    height: 100.h,
                                    child: Image.network(
                                        widget.categoryModel.imageUrl),
                                  )
                                : SizedBox(
                                    width: 100.w,
                                    height: 100.h,
                                    child: Image.network(imageUrl),
                                  ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        buttonLargeWidget(
                            onTap: () {
                              _showPicker(context);
                            },
                            buttonName: 'Kategoriya rasmini yangilash'),
                        SizedBox(height: 8.h),
                        buttonLargeWidget(
                            onTap: () {
                              CategoryModel categoryModel = CategoryModel(
                                categoryId: widget.categoryModel.categoryId,
                                categoryName: updateCategoryCantroller.text,
                                description:
                                    updateCategoryDescriptionCantroller.text,
                                imageUrl: imageUrl.isEmpty
                                    ? widget.categoryModel.imageUrl
                                    : imageUrl,
                                createdAt: DateTime.now().toString(),
                              );

                              Provider.of<CategoryViewModel>(context,
                                      listen: false)
                                  .updateCategory(categoryModel);
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
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: SvgPicture.asset(
                      AppImages.icon_galery,
                      height: 40.h,
                    ),
                    title: const Text("Galareya"),
                    onTap: () {
                      _getFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: SvgPicture.asset(
                    AppImages.icon_camera_upload_photo,
                    height: 40.h,
                  ),
                  title: const Text('Kamera'),
                  onTap: () {
                    _getFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1000,
      maxHeight: 1000,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      setState(() {
        isLoading = true;
        getMyToast(message: 'Rasm yuklanmoqda');
      });
      imageUrl = await FileUploader.imageUploader(pickedFile, 'categoryImages');
      setState(() {
        isLoading = false;
        _image = pickedFile;
      });
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      setState(() {
        isLoading = true;
        getMyToast(message: 'Rasm yuklanmoqda');
      });
      imageUrl = await FileUploader.imageUploader(pickedFile, 'categoryImages');
      setState(() {
        isLoading = false;
        _image = pickedFile;
      });
    }
  }
}
