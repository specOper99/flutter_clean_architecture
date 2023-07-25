import 'package:equatable/equatable.dart';

class JWTTokensResponse extends Equatable {
  final String status;
  final String accessToken;
  final String refreshToken;

  JWTTokensResponse({
    required this.status,
    required this.accessToken,
    required this.refreshToken,
  });

  factory JWTTokensResponse.fromMap(Map<String, dynamic> map) {
    return JWTTokensResponse(
      status: (map['status'] ?? '') as String,
      accessToken: (map['accessToken'] ?? '') as String,
      refreshToken: (map['refreshToken'] ?? '') as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, accessToken, refreshToken];
}
