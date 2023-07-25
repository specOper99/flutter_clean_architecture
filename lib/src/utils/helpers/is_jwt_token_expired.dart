import 'package:jwt_decoder/jwt_decoder.dart';

bool isJwtTokenExpired(String? token) {
  if (token == null) return true;
  return JwtDecoder.isExpired(token);
}
