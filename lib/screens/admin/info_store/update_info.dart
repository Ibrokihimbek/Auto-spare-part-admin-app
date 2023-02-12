import 'package:admin_aplication/data/models/info_model.dart';
import 'package:admin_aplication/data/models/latlong/lat_long.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/view_model/category_view_model.dart';
import 'package:admin_aplication/view_model/info_view_model.dart';
import 'package:admin_aplication/widgets/button_large.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:admin_aplication/widgets/input_decoration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateInfoStore extends StatefulWidget {
  final LatLong latLong;
  final InfoModel infoModel;
  UpdateInfoStore({super.key, required this.infoModel, required this.latLong});

  @override
  State<UpdateInfoStore> createState() => _UpdateInfoStoreState();
}

class _UpdateInfoStoreState extends State<UpdateInfoStore> {
  final TextEditingController updateInfoStore = TextEditingController();
  final TextEditingController updateSellerName = TextEditingController();
  final TextEditingController updateSellerPhone = TextEditingController();
  final TextEditingController updateAddressStore = TextEditingController();

  @override
  void initState() {
    updateInfoStore.text = widget.infoModel.infoStore;
    updateSellerName.text = widget.infoModel.sellerName;
    updateSellerPhone.text = widget.infoModel.sellerPhoneNumber;
    updateAddressStore.text = widget.infoModel.address;

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
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:
                Consumer<InfoViewModel>(builder: (context, viewModel, child) {
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
                        controller: updateSellerName,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (category) =>
                            category != null && category.length < 2
                                ? "2 ta belgidan ko'p kiriting"
                                : null,
                        style: fontPoppinsW400(appcolor: AppColors.white),
                        decoration:
                            getInputDecoration(label: updateSellerName.text),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        "Sotuvchining telefon raqami",
                        style: fontPoppinsW400(appcolor: AppColors.white)
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: updateSellerPhone,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (category) =>
                            category != null && category.length < 9
                                ? "9 ta belgidan ko'p kiriting"
                                : null,
                        style: fontPoppinsW400(appcolor: AppColors.white),
                        decoration:
                            getInputDecoration(label: updateSellerPhone.text),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        "Do'kon manzili",
                        style: fontPoppinsW400(appcolor: AppColors.white)
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        maxLines: 2,
                        controller: updateAddressStore,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (category) =>
                            category != null && category.length < 6
                                ? "6 ta belgidan ko'p kiriting"
                                : null,
                        style: fontPoppinsW400(appcolor: AppColors.white),
                        decoration:
                            getInputDecoration(label: updateAddressStore.text),
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
                        controller: updateInfoStore,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (category) =>
                            category != null && category.length < 6
                                ? "6 ta belgidan ko'p kiriting"
                                : null,
                        style: fontPoppinsW400(appcolor: AppColors.white),
                        decoration:
                            getInputDecoration(label: updateInfoStore.text),
                      ),
                      SizedBox(height: 20.h),
                      buttonLargeWidget(
                          onTap: () {
                            InfoModel infoModel = InfoModel(
                              lat: widget.latLong.lattitude.toString(),
                              long: widget.latLong.longitude.toString(),
                              address: updateAddressStore.text,
                              infoId: widget.infoModel.infoId,
                              infoStore: updateInfoStore.text,
                              sellerName: updateSellerName.text,
                              sellerPhoneNumber: updateSellerPhone.text,
                            );
                            Provider.of<InfoViewModel>(context, listen: false)
                                .updateInformation(infoModel);
                            Navigator.pop(context);
                          },
                          buttonName: "Ma'lumotlarni yangilash"),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
