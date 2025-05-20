import 'package:equatable/equatable.dart';

class ProfileUserModel extends Equatable {
  final String? userId;
  final String? email;
  final String? name;
  final String? userName;
  final dynamic phone;
  final String? profilePicture;

  const ProfileUserModel({
    this.userId,
    this.email,
    this.name,
    this.userName,
    this.phone,
    this.profilePicture,
  });

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserModel(
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      userName: json['userName'] as String?,
      phone: json['phone'] as dynamic,
      profilePicture: json['profilePicture'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'email': email,
    'name': name,
    'userName': userName,
    'phone': phone,
    'profilePicture': profilePicture,
  };

  @override
  List<Object?> get props {
    return [userId, email, name, userName, phone, profilePicture];
  }
}
