class RefreshTokenResponse {
  final String token;

  RefreshTokenResponse({required this.token});

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponse(token: json['token'] as String);
  }
}
