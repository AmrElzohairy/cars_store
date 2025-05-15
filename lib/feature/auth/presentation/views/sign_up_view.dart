import 'package:cars_store/feature/auth/presentation/views/widgets/custom_sign_up_form.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/custom_text_row.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/sign_up_bloc_consumer.dart';
import 'package:flutter/material.dart';
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
  late TextEditingController fullName;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    fullName = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullName.dispose();
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
                  Image.asset(Assets.imagesLogo, width: 76, height: 76),
                ],
              ),
              const VerticalSpace(height: 50),
              Text('Sign Up ', style: AppStyles.font20SemiBoldPrimary(context)),
              const VerticalSpace(height: 5),
              Text('Find your dream car', style: AppStyles.font14RegularBlack(context)),
              const VerticalSpace(height: 44),
              CustomSignUpForm(
                formKey: formKey,
                usernameController: fullName,
                emailController: emailController,
                phoneController: phoneController,
                passwordController: passwordController,
              ),
              const VerticalSpace(height: 40),
              SignUpBlocConsumer(
                formKey: formKey,
                fullName: fullName,
                emailController: emailController,
                phoneController: phoneController,
                passwordController: passwordController,
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
