import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/core/widgets/custom_error_widget.dart';
import 'package:cars_store/feature/car_details/presentation/views/car_details_view.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_carousel.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_details_skeleton.dart';
import 'package:cars_store/feature/car_details/presentation/views/widgets/car_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/car_details_cubit/car_details_cubit.dart';

class CarDetailsBlocBuilder extends StatelessWidget {
  const CarDetailsBlocBuilder({super.key, required this.widget});

  final CarDetailsView widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarDetailsCubit, CarDetailsState>(
      builder: (context, state) {
        if (state is CarDetailsLoading) {
          return const CarDetailsSkeleton();
        } else if (state is CarDetailsError) {
          return CustomErrorWidget(
            onRetry: () {
              context.read<CarDetailsCubit>().getCarDetails(widget.carId);
            },
            message: state.errMessage,
          );
        } else if (state is CarDetailsLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: VerticalSpace(height: 50)),
                SliverToBoxAdapter(
                  child: CarDetailsCarousel(carDetailsEntity: state.carDetails),
                ),
                SliverToBoxAdapter(
                  child: CarInformations(carDetailsEntity: state.carDetails),
                ),
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
    );
  }
}
