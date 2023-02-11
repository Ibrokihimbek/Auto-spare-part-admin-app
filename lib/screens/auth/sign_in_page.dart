import 'package:admin_aplication/screens/auth/widgets/login_widgets.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/utils/app_images.dart';
import 'package:admin_aplication/view_model/auth_view_model.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:admin_aplication/widgets/input_decoration_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  final VoidCallback onClickSignUp;
  const SignInPage({super.key, required this.onClickSignUp});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPas = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 36, right: 24, left: 24).r,
              child: Column(
                children: [
                  LoginWidgets.logoWidget(image: AppImages.image_car),
                  SizedBox(height: 96.h),
                  LoginWidgets.textWidget(
                      title: 'Login', subTitle: 'Welcome to Car Spare Part'),
                  SizedBox(height: 44.h),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: fontPoppinsW400(appcolor: AppColors.white)
                        .copyWith(fontSize: 17.sp),
                    decoration: getInputDecoration(label: "Email"),
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !isPas,
                    textInputAction: TextInputAction.done,
                    style: fontPoppinsW400(appcolor: AppColors.white)
                        .copyWith(fontSize: 17.sp),
                    decoration: getInputDecorationByPassword(
                        label: 'Password',
                        onTap: () {
                          setState(() {
                            isPas = !isPas;
                          });
                        },
                        isPas: isPas),
                  ),
                  SizedBox(height: 34.h),
                  LoginWidgets.buttonWidget(
                    buttonName: 'Login',
                    onTap: signIn,
                  ),
                  SizedBox(height: 44.h),
                  RichText(
                    text: TextSpan(
                      style: fontPoppinsW300(
                        appcolor: AppColors.white.withOpacity(0.5),
                      ).copyWith(fontSize: 14.sp),
                      text: "Don't have an account?  ",
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickSignUp,
                          text: "Sign Up",
                          style: fontPoppinsW400(
                            appcolor: AppColors.white,
                          ).copyWith(fontSize: 16.sp),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    Provider.of<AuthViewModel>(context, listen: false).signIn(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
