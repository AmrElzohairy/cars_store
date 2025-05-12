class SignInResponseModel {
  dynamic message;
  String? userId;
  String? userName;
  String? email;
  dynamic phone;
  bool? isAuthenticated;
  String? token;
  String? refreshToken;
  DateTime? refreshTokenExpiration;

  SignInResponseModel({
    this.message,
    this.userId,
    this.userName,
    this.email,
    this.phone,
    this.isAuthenticated,
    this.token,
    this.refreshToken,
    this.refreshTokenExpiration,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      message: json['message'] as dynamic,
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as dynamic,
      isAuthenticated: json['isAuthenticated'] as bool?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpiration:
          json['refreshTokenExpiration'] == null
              ? null
              : DateTime.parse(json['refreshTokenExpiration'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'userId': userId,
    'userName': userName,
    'email': email,
    'phone': phone,
    'isAuthenticated': isAuthenticated,
    'token': token,
    'refreshToken': refreshToken,
    'refreshTokenExpiration': refreshTokenExpiration?.toIso8601String(),
  };
}
