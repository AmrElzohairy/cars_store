import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/assets.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/auth/data/models/sign_in_body.dart';
import 'package:cars_store/feature/auth/presentation/cubits/cubit/sign_in_cubit.dart';
import 'package:cars_store/feature/auth/presentation/views/sign_up_view.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/custom_text_row.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/login_form.dart';
import 'package:cars_store/feature/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_app_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const routeName = '/login_view';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
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
              Text('Login ', style: AppStyles.font20SemiBoldPrimary),
              const VerticalSpace(height: 5),
              Text('Welcome to CarStore', style: AppStyles.font14RegularBlack),
              const VerticalSpace(height: 44),
              LoginForm(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const VerticalSpace(height: 40),
              BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInSuccess) {
                    context.goNamed(HomeView.routeName);
                  }
                  if (state is SignInFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errMessage),
                        backgroundColor: Colors.red,
                      ),
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
              ),
              const VerticalSpace(height: 30),
              CustomTextRow(
                onTap: () {
                  context.pushNamed(SignUpView.routeName);
                },
                askText: 'Don’t have an account?',
                inkWellText: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
