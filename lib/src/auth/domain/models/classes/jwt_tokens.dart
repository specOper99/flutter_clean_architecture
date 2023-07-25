class JWTTokens {
  String accessToken;
  String refreshToken;

  JWTTokens({required this.accessToken, required this.refreshToken});

  factory JWTTokens.fromJson(Map<String, dynamic> json) {
    return JWTTokens(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
