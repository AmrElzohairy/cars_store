import 'package:cars_store/core/utils/app_styles.dart';
import 'package:cars_store/core/utils/spacing_widgets.dart';
import 'package:cars_store/feature/profile/domain/entity/profile_user_entity.dart';
import 'package:flutter/material.dart';

class ProfileUserData extends StatelessWidget {
  const ProfileUserData({super.key, required this.userEntity});
  final ProfileUserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            "Name: ${userEntity.name}",
            style: AppStyles.font16MediumBlack(context),
          ),
          const VerticalSpace(height: 10),
          Text(
            "Id: ${userEntity.id}",
            style: AppStyles.font14MediumBlack(context),
          ),
          const VerticalSpace(height: 10),
          Text(
            "Email: ${userEntity.email}",
            style: AppStyles.font16MediumBlack(context),
          ),
          const VerticalSpace(height: 10),
          Text(
            "Phone: +20 1234567890",
            style: AppStyles.font16MediumBlack(context),
          ),
          const VerticalSpace(height: 10),
          Text(
            "Address: 123 Main St, City, Country",
            style: AppStyles.font16MediumBlack(context),
          ),
          const VerticalSpace(height: 10),
        ],
      ),
    );
  }
}
