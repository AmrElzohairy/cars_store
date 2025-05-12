import 'package:cars_store/core/widgets/custom_app_button.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/custom_sign_up_form.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/custom_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/spacing_widgets.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const routeName = '/sign_up_view';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late GlobalKey<FormState> formKey;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VerticalSpace(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesLogo, width: 76.w, height: 76.h),
                ],
              ),
              const VerticalSpace(height: 50),
              Text('Sign Up ', style: AppStyles.font20SemiBoldPrimary),
              const VerticalSpace(height: 5),
              Text('Find your dream car', style: AppStyles.font14RegularBlack),
              const VerticalSpace(height: 44),
              CustomSignUpForm(
                formKey: formKey,
                usernameController: usernameController,
                emailController: emailController,
                phoneController: phoneController,
                passwordController: passwordController,
              ),
              const VerticalSpace(height: 40),
              CustomAppButton(
                text: 'Sign Up',
                onPressed: () {},
                isLoading: false,
              ),
              const VerticalSpace(height: 30),
              CustomTextRow(
                onTap: () {
                  context.pop();
                },
                askText: 'Already have an account?',
                inkWellText: 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
