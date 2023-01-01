import 'package:admin_aplication/data/models/user_model.dart';
import 'package:admin_aplication/data/service/notification_api_cervice.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/utils/app_images.dart';
import 'package:admin_aplication/view_model/users_view_model.dart';
import 'package:admin_aplication/widgets/button_large.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:admin_aplication/widgets/input_decoration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AllUsersPage extends StatefulWidget {
  const AllUsersPage({Key? key}) : super(key: key);

  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {
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
          child: SafeArea(
            child: StreamBuilder<List<UserModel>>(
              stream: Provider.of<UsersViewModel>(context, listen: false)
                  .listenUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  List<UserModel> users = snapshot.data!;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 36,
                              top: 8,
                              bottom: 8,
                            ).r,
                            child: SizedBox(
                              width: 250.w,
                              child: Text(
                                'Barcha foydalanuvchilarga habar yuborish',
                                style:
                                    fontPoppinsW500(appcolor: AppColors.white),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              String message = "";
                              await _showDialog((value) {
                                message = value;
                              });

                              String messageId = await NotificationApiService
                                  .sendNotificationToAll(
                                      topicName: "users", message: message);
                            },
                            icon: const Icon(
                              Icons.notification_add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 700.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return categoryItem(
                              users[index],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(ValueChanged<String> message) async {
    final TextEditingController controller = TextEditingController();
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            backgroundColor: AppColors.C_363941,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: AppColors.white,
                  width: 1,
                ),
              ),
              height: 200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    TextFormField(
                      controller: controller,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: fontPoppinsW400(appcolor: AppColors.white)
                          .copyWith(fontSize: 17.sp),
                      decoration: getInputDecoration(label: "Habar"),
                    ),
                    SizedBox(height: 12.h),
                    buttonLargeWidget(
                        onTap: () {
                          message.call(controller.text);
                          Navigator.pop(context);
                        },
                        buttonName: "jo'natish"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget categoryItem(UserModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6).r,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.C_FAFAFA.withOpacity(0.50),
        ),
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(12).r,
          child: Row(
            children: [
              SizedBox(
                width: 250.w,
                child: Text(
                  model.email,
                  style: fontPoppinsW500(appcolor: AppColors.white),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () async {
                  String message = "";
                  await _showDialog((value) {
                    message = value;
                  });

                  int sendSuccess =
                      await NotificationApiService.sendNotificationToUser(
                    fcmToken: model.fcmToken,
                    message: message,
                  );
                },
                child: const Icon(
                  Icons.notification_add,
                  color: AppColors.white,
                ),
              ),
              SizedBox(width: 20.w),
              InkWell(
                onTap: () {
                  Provider.of<UsersViewModel>(context, listen: false)
                      .deleteUser(model.docId);
                },
                child: SvgPicture.asset(AppImages.icon_delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
