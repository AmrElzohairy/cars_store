import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cars_store/core/widgets/custom_app_button.dart';
import 'package:cars_store/core/widgets/custom_snac_bar.dart';
import 'package:cars_store/feature/auth/data/models/sign_up_body_model.dart';
import 'package:cars_store/feature/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/custom_sign_up_form.dart';
import 'package:cars_store/feature/auth/presentation/views/widgets/custom_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                usernameController: fullName,
                emailController: emailController,
                phoneController: phoneController,
                passwordController: passwordController,
              ),
              const VerticalSpace(height: 40),
              BlocConsumer<SignUpCubit, SignUpState>(
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
                      title: "Sign Up Successfully",
                      message:
                          "Sign Up Successfully, Check your email for verification",
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
