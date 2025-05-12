import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cars_store/core/cache/cache_constants.dart';
import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:cars_store/core/widgets/custom_app_button.dart';
import 'package:cars_store/core/widgets/custom_snac_bar.dart';
import 'package:cars_store/feature/auth/data/models/sign_in_body.dart';
import 'package:cars_store/feature/auth/presentation/cubits/cubit/sign_in_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInBlocConsumer extends StatelessWidget {
  const SignInBlocConsumer({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          context.goNamed(HomeView.routeName);
          showCustomSnacBar(
            context,
            title: "Success",
            message: "Login successfully",
            contentType: ContentType.success,
          );
          CacheHelper.set(key: CacheKeys.isAuthenticated, value: true);
        }
        if (state is SignInFailure) {
          showCustomSnacBar(
            context,
            message: state.errMessage,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        var signInCubit = context.read<SignInCubit>();
        return CustomAppButton(
          text: 'Login',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              signInCubit.signIn(
                SignInBody(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );
            }
          },
          isLoading: state is SignInLoading ? true : false,
        );
      },
    );
  }
}
