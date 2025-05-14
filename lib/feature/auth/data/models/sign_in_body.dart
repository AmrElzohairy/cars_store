class SignInBody {
  final String email;
  final String password;

  SignInBody({required this.email, required this.password});

  factory SignInBody.fromJson(Map<String, dynamic> json) => SignInBody(
    email: json['email'] as String,
    password: json['password'] as String,
  );

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
