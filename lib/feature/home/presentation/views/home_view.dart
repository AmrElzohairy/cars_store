import 'package:cars_store/core/utils/app_colors.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Row(
          children: [
            Spacer(),
            HorizontalSpace(width: 10),
            Text('CarsStore', style: TextStyle(color: AppColors.primaryColor)),
            Spacer(flex: 2),
            Icon(Icons.notifications_none),
          ],
        ),
      ),
      body: const Center(child: Text('Home View')),
    );
  }
}
