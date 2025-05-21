import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/core/widgets/custom_app_button.dart';
import 'package:cars_store/core/widgets/custom_error_widget.dart';
import 'package:cars_store/feature/auth/presentation/views/login_view.dart';
import 'package:cars_store/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:cars_store/feature/profile/presentation/views/widgets/profile_image.dart';
import 'package:cars_store/feature/profile/presentation/views/widgets/profile_user_data.dart';
import 'package:cars_store/feature/profile/presentation/views/widgets/profile_view_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBlocBuilder extends StatelessWidget {
  const ProfileViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const ProfileViewSkeleton();
        } else if (state is ProfileError) {
          return CustomErrorWidget(
            onRetry: () {
              context.read<ProfileCubit>().getUserData();
            },
            message: state.error,
          );
        } else if (state is ProfileLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerticalSpace(height: 50),
                Text("Profile", style: AppStyles.font20MediumBlack(context)),
                const VerticalSpace(height: 30),
                const ProfileImage(),
                const VerticalSpace(height: 30),
                ProfileUserData(userEntity: state.user),
                const Spacer(),
                CustomAppButton(
                  text: 'Logout',
                  onPressed: () {
                    CacheHelper.clearAllData();
                    CacheHelper.deleteAllSecureData();
                    context.goNamed(LoginView.routeName);
                  },
                  isLoading: false,
                ),
                const VerticalSpace(height: 160),
              ],
            ),
          );
        } else {
          return const Center(child: Text("Something went wrong"));
        }
      },
    );
  }
}
