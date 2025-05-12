import 'package:cars_store/core/utils/assets.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/custom_auth_text_form_field.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/custom_password_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/spacing_widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.formKey,
  });
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomAuthTextFormField(
            controller: usernameController,
            textInputAction: TextInputAction.next,
            labelText: 'username',
            icon: Assets.imagesUsernameIcon,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const VerticalSpace(height: 20),
          CustomPasswordFormField(
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
