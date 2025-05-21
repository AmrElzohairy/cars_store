import 'package:cars_store/core/utils/assets.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/core/widgets/custom_search_field.dart';
import 'package:cars_store/feature/home/presentation/views/widgets/home_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchFieldAndFilters extends StatelessWidget {
  const HomeSearchFieldAndFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSearchField(
          onTap: () {
            showSearch(context: context, delegate: HomeSearchDelegate());
          },
        ),
        const HorizontalSpace(width: 10),
        SvgPicture.asset(Assets.imagesFilterIcon),
      ],
    );
  }
}
