import 'package:cars_store/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
  });
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            Assets.imagesSearhIcon,
            fit: BoxFit.scaleDown,
          ),
          hintText: 'Search',
          fillColor: Colors.grey.shade200,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}
