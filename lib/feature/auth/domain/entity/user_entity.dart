import 'package:cars_store/feature/auth/data/models/sign_in_response_model.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String? userName;
  final String? email;
  final dynamic phone;
  final bool? isAuthenticated;

  const UserEntity({
    this.userId,
    this.userName,
    this.email,
    this.phone,
    this.isAuthenticated,
  });

  @override
  List<Object?> get props => [
    userId,
    userName,
    email,
    phone,
    isAuthenticated,
  ];

  // Method to convert SignInResponseModel to UserEntity
  factory UserEntity.fromResponse(SignInResponseModel response) {
    return UserEntity(
      userId: response.userId,
      userName: response.userName,
      email: response.email,
      phone: response.phone,
      isAuthenticated: response.isAuthenticated,
    );
  }
}