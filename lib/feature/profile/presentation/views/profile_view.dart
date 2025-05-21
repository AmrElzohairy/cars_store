import 'package:cars_store/core/widgets/custom_refresh_indicator.dart';
import 'package:cars_store/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:cars_store/feature/profile/presentation/views/widgets/profile_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    context.read<ProfileCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        context.read<ProfileCubit>().getUserData();
      },
      child: const ProfileViewBlocBuilder(),
    );
  }
}
