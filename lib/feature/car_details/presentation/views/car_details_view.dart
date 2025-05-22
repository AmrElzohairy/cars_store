import 'package:flutter/material.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});
  static const routeName = "/car_details_view";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Car Details View")));
  }
}
