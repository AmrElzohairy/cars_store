import 'package:cars_store/feature/profile/data/models/profile_user_model.dart';

class ProfileUserEntity {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;

  ProfileUserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  factory ProfileUserEntity.fromModel(ProfileUserModel user) {
    return ProfileUserEntity(
      id: user.userId ?? '',
      name: user.name ?? '',
      email: user.email ?? '',
      phoneNumber: user.phone ?? '',
      address: user.userName ?? '',
    );
  }
}
