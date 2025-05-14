class SignInBodyModel {
  final String email;
  final String password;

  SignInBodyModel({required this.email, required this.password});

  factory SignInBodyModel.fromJson(Map<String, dynamic> json) =>
      SignInBodyModel(
        email: json['email'] as String,
        password: json['password'] as String,
      );

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
