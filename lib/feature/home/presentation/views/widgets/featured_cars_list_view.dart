import 'package:cars_store/core/utils/media_query_size.dart';
import 'package:cars_store/feature/home/presentation/cubits/featured_cars_cubit/featured_cars_cubit.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/featured_cars_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedCarsListView extends StatelessWidget {
  const FeaturedCarsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCarsCubit, FeaturedCarsState>(
      builder: (context, state) {
        if (state is FeaturedCarsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FeaturedCarsLoaded) {
          return SizedBox(
            height: height(context) * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: FeaturedCarsListItem(),
                );
              },
            ),
          );
        } else if (state is FeaturedCarsError) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text("Something went wrong......"));
        }
      },
    );
  }
}
