import 'package:cars_store/core/utils/assets.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/core/widgets/custom_search_field.dart';
import 'package:cars_store/feature/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchFieldAndFilters extends StatelessWidget {
  const HomeSearchFieldAndFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSearchField(
          onTap: () {
            // Get the SearchCubit from the nearest context
            final searchCubit = context.read<SearchCubit>();
            
            // Show search with our delegate
            showSearch(
              context: context, 
              delegate: HomeSearchDelegate(searchCubit: searchCubit),
            ).then((carId) {
              // Handle navigation to car details if a car was selected
              if (carId != null) {
                // Navigate to car details page using the carId
                // Example: Navigator.pushNamed(context, '/car_details', arguments: carId);
              }
            });
          },
        ),
        const HorizontalSpace(width: 10),
        SvgPicture.asset(Assets.imagesFilterIcon),
      ],
    );
  }
}