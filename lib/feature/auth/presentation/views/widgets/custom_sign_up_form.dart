import 'package:cars_store/core/utils/assets.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/custom_auth_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/spacing_widgets.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            controller: usernameController,
            labelText: 'username',
            icon: Assets.imagesUsernameIcon,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const VerticalSpace(height: 15),
          CustomAuthTextFormField(
            controller: emailController,
            labelText: 'Email',
            icon: Assets.imagesEmail1SvgrepoCom,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const VerticalSpace(height: 15),
          CustomAuthTextFormField(
            controller: phoneController,
            labelText: 'phone number',
            icon: Assets.imagesPhoneSvgrepoCom,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          const VerticalSpace(height: 15),
          CustomAuthTextFormField(
            controller: passwordController,
            labelText: 'password',
            icon: Assets.imagesPasswordIcon,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
