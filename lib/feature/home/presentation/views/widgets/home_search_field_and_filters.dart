import 'package:cars_store/core/utils/assets.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/core/widgets/custom_search_field.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchFieldAndFilters extends StatelessWidget {
  const HomeSearchFieldAndFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomSearchField(),
        const HorizontalSpace(width: 10),
        SvgPicture.asset(Assets.imagesFilterIcon),
      ],
    );
  }
}
