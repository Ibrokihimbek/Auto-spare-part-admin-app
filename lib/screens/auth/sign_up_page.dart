import 'package:admin_aplication/screens/auth/widgets/login_widgets.dart';
import 'package:admin_aplication/utils/app_colors.dart';
import 'package:admin_aplication/utils/app_images.dart';
import 'package:admin_aplication/view_model/auth_view_model.dart';
import 'package:admin_aplication/widgets/font_style_widget.dart';
import 'package:admin_aplication/widgets/input_decoration_widget.dart';
import 'package:admin_aplication/widgets/toast_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const SignUpPage({super.key, required this.onClickedSignIn});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPas = false;
  bool ispasTwo = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
              child: Padding(
                padding: const EdgeInsets.only(top: 36, right: 24, left: 24).r,
                child: Column(
                  children: [
                    LoginWidgets.logoWidget(image: AppImages.image_car),
                    SizedBox(height: 96.h),
                    LoginWidgets.textWidget(
                        title: 'Sign Up', subTitle: 'Find Car Spare Parts'),
                    SizedBox(height: 44.h),
                    TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? "Enter a valid email"
                              : null,
                      style: fontPoppinsW400(appcolor: AppColors.white)
                          .copyWith(fontSize: 17.sp),
                      decoration: getInputDecoration(label: "Email"),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isPas,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) =>
                          password != null && password.length < 6
                              ? "Enter at least 6 charcter !"
                              : null,
                      style: fontPoppinsW400(appcolor: AppColors.white)
                          .copyWith(fontSize: 17.sp),
                      decoration: getInputDecorationByPassword(
                        label: 'Password',
                        onTap: () {
                          setState(() {
                            setState(() {
                              isPas = !isPas;
                            });
                          });
                        },
                        isPas: isPas,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      controller: confirmPasswordController,
                      textInputAction: TextInputAction.done,
                      obscureText: !ispasTwo,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) =>
                          password != null && password.length < 6
                              ? "Enter at least 6 charcter !"
                              : null,
                      style: fontPoppinsW400(appcolor: AppColors.white)
                          .copyWith(fontSize: 17.sp),
                      decoration: getInputDecorationByPassword(
                        label: 'Coniform Password',
                        onTap: () {
                          setState(() {
                            setState(() {
                              ispasTwo = !ispasTwo;
                            });
                          });
                        },
                        isPas: ispasTwo,
                      ),
                    ),
                    SizedBox(height: 34.h),
                    LoginWidgets.buttonWidget(
                      buttonName: 'Sign Up',
                      onTap: signUp,
                    ),
                    SizedBox(height: 44.h),
                    RichText(
                      text: TextSpan(
                        style: fontPoppinsW300(
                          appcolor: AppColors.white.withOpacity(0.5),
                        ).copyWith(fontSize: 14.sp),
                        text: "Already have an account?  ",
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignIn,
                            text: "Sign In",
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
      ),
    );
  }

  signUp() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (confirmPassword == password) {
      Provider.of<AuthViewModel>(context, listen: false).signUp(
        email: email,
        password: password,
      );
    } else {
      getMyToast(message: "Passwords don't match!");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
