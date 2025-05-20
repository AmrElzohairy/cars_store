import 'package:cars_store/feature/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/service_locator.dart';
import '../../../../profile/domain/repo/profile_repo.dart';
import '../../../../profile/presentation/views/profile_view.dart';

class ProfileViewBlocProvider extends StatelessWidget {
  const ProfileViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt<ProfileRepo>())..getUserData(),
      child: const ProfileView(),
    );
  }
}
