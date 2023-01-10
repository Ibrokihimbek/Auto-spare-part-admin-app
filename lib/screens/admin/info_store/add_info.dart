import 'package:admin_aplication/data/models/info_model.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/view_model/info_view_model.dart';
import 'package:admin_aplication/widgets/button_large.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:admin_aplication/widgets/input_decoration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddInfoPage extends StatefulWidget {
  const AddInfoPage({super.key});

  @override
  State<AddInfoPage> createState() => _AddInfoPageState();
}

class _AddInfoPageState extends State<AddInfoPage> {
  final TextEditingController addInfoStore = TextEditingController();
  final TextEditingController addSellerName = TextEditingController();
  final TextEditingController addSellerPhone = TextEditingController();
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
          child: Consumer<InfoViewModel>(builder: (context, viewModel, child) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Text(
                      "Sotuvchining ismi",
                      style: fontPoppinsW400(appcolor: AppColors.white)
                          .copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: addSellerName,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (category) =>
                          category != null && category.length < 2
                              ? "2 ta belgidan ko'p kiriting"
                              : null,
                      style: fontPoppinsW400(appcolor: AppColors.white),
                      decoration: getInputDecoration(
                          label: "Sotuvchining ismini kiriting"),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Sotuvchining telefon raqami",
                      style: fontPoppinsW400(appcolor: AppColors.white)
                          .copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: addSellerPhone,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (category) =>
                          category != null && category.length < 9
                              ? "9 ta belgidan ko'p kiriting"
                              : null,
                      style: fontPoppinsW400(appcolor: AppColors.white),
                      decoration:
                          getInputDecoration(label: "(+998)00 000 00 00"),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Do'kon haqida ma'lumot",
                      style: fontPoppinsW400(appcolor: AppColors.white)
                          .copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      maxLines: 4,
                      controller: addInfoStore,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (category) =>
                          category != null && category.length < 6
                              ? "6 ta belgidan ko'p kiriting"
                              : null,
                      style: fontPoppinsW400(appcolor: AppColors.white),
                      decoration: getInputDecoration(
                          label: "Do'kon haqida ma'lumot kiriting"),
                    ),
                    SizedBox(height: 20.h),
                    buttonLargeWidget(
                        onTap: () {
                          InfoModel infoModel = InfoModel(
                            infoId: '',
                            infoStore: addInfoStore.text,
                            sellerName: addSellerName.text,
                            sellerPhoneNumber: addSellerPhone.text,
                          );
                          Provider.of<InfoViewModel>(context, listen: false)
                              .addInformation(infoModel);
                          Navigator.pop(context);
                        },
                        buttonName: "Ma'lumotlarni qo'shish"),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
