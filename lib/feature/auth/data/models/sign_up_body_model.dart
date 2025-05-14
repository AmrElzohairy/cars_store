class SignUpBodyModel {
  String fullName;
  String email;
  String phone;
  String password;

  SignUpBodyModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory SignUpBodyModel.fromJson(Map<String, dynamic> json) {
    return SignUpBodyModel(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'email': email,
    'phone': phone,
    'password': password,
  };
}
