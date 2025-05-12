import 'package:cars_store/core/cache/cache_helper.dart';
import 'package:cars_store/core/helpers/service_locator.dart';
import 'package:cars_store/core/routing/app_router.dart';
import 'package:cars_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setupDependencies();
  runApp(const CarsStore());
}

class CarsStore extends StatelessWidget {
  const CarsStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: 'Cars Store',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBgColor,
            primaryColor: AppColors.primaryColor,
            fontFamily: "Poppins",
          ),
        );
      },
    );
  }
}
