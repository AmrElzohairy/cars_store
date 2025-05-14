import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cars_store/core/widgets/custom_app_button.dart';
import 'package:cars_store/core/widgets/custom_snac_bar.dart';
import 'package:cars_store/feature/auth/data/models/sign_up_body_model.dart';
import 'package:cars_store/feature/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({
    super.key,
    required this.formKey,
    required this.fullName,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController fullName;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          showCustomSnacBar(
            context,
            title: "Sign Up Failed",
            message: state.errMessage,
            contentType: ContentType.failure,
          );
        } else if (state is SignUpSuccess) {
          showCustomSnacBar(
            context,
            title: "Sign Up Successfully,",
            message: "Check your email for verification",
            contentType: ContentType.success,
          );
          context.pop();
        }
      },
      builder: (context, state) {
        var signUpCubit = context.read<SignUpCubit>();
        return CustomAppButton(
          text: 'Sign Up',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              signUpCubit.signUp(
                SignUpBodyModel(
                  fullName: fullName.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  password: passwordController.text,
                ),
              );
            }
          },
          isLoading: state is SignUpLoading ? true : false,
        );
      },
    );
  }
}
