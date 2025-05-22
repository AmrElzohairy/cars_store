import 'package:cars_store/core/widgets/custom_error_widget.dart';
import 'package:cars_store/feature/car_details/presentation/cubits/car_details_cubit/car_details_cubit.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_carousel.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/spacing_widgets.dart';

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
    return Scaffold(
      body: BlocBuilder<CarDetailsCubit, CarDetailsState>(
        builder: (context, state) {
          if (state is CarDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CarDetailsError) {
            return CustomErrorWidget(
              onRetry: () {
                context.read<CarDetailsCubit>().getCarDetails(widget.carId);
              },
              message: state.errMessage,
            );
          } else if (state is CarDetailsLoaded) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: VerticalSpace(height: 50)),
                  SliverToBoxAdapter(child: CarDetailsCarousel()),
                  SliverToBoxAdapter(child: CarInformations()),
                ],
              ),
            );
          }
          return CustomErrorWidget(
            onRetry: () {
              context.read<CarDetailsCubit>().getCarDetails(widget.carId);
            },
            message: "Something went wrong",
          );
        },
      ),
    );
  }
}
