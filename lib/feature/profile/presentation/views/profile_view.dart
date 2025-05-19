import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/core/widgets/custom_app_button.dart';
import 'package:cars_store/feature/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
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
            const VerticalSpace(height: 150),
          ],
        ),
      ),
    );
  }
}
