import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/core/widgets/custom_app_button.dart';
import 'package:cars_store/feature/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileViewSkeleton extends StatelessWidget {
  const ProfileViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const VerticalSpace(height: 50),
            Text("Profile", style: AppStyles.font20MediumBlack(context)),
            const VerticalSpace(height: 30),
            Container(
              height: height(context) * 0.15,
              width: width(context) * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(80),
              ),
            ),
            const VerticalSpace(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    "Name: Admin",
                    style: AppStyles.font16MediumBlack(context),
                  ),
                  const VerticalSpace(height: 10),
                  Text(
                    "Email: OuPbM@example.com",
                    style: AppStyles.font16MediumBlack(context),
                  ),
                  const VerticalSpace(height: 10),
                  Text(
                    "Phone: +20 1234567890",
                    style: AppStyles.font16MediumBlack(context),
                  ),
                  const VerticalSpace(height: 10),
                  Text(
                    "Address: 123 Main St, City, Country",
                    style: AppStyles.font16MediumBlack(context),
                  ),
                  const VerticalSpace(height: 10),
                ],
              ),
            ),
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
            const VerticalSpace(height: 210),
          ],
        ),
      ),
    );
  }
}
