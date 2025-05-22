import 'package:cars_store/feature/car_details/presentation/cubits/car_details_cubit/car_details_cubit.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarDetailsView extends StatefulWidget {
  const CarDetailsView({super.key, required this.carId});
  static const routeName = "/car_details_view";
  final String carId;
  @override
  State<CarDetailsView> createState() => _CarDetailsViewState();
}

class _CarDetailsViewState extends State<CarDetailsView> {
  @override
  void initState() {
    context.read<CarDetailsCubit>().getCarDetails(widget.carId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CarDetailsBlocBuilder(widget: widget));
  }
}
