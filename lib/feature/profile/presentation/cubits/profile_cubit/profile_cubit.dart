import 'package:cars_store/feature/profile/domain/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cars_store/feature/profile/domain/entity/profile_user_entity.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> getUserData() async {
    emit(ProfileLoading());
    final result = await profileRepo.getUserData();
    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (user) => emit(ProfileLoaded(user)),
    );
  }
}
