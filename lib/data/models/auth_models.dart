import 'package:json_annotation/json_annotation.dart';

part 'auth_models.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String email;
  final String password;
  final String name;
  final String? fcmToken;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.name,
    this.fcmToken,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;
  final String? fcmToken;

  LoginRequest({
    required this.email,
    required this.password,
    this.fcmToken,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class OAuthRequest {
  final String provider; // 'GOOGLE', 'NAVER', 'KAKAO'
  final String code;
  final String? fcmToken;

  OAuthRequest({
    required this.provider,
    required this.code,
    this.fcmToken,
  });

  factory OAuthRequest.fromJson(Map<String, dynamic> json) =>
      _$OAuthRequestFromJson(json);
  Map<String, dynamic> toJson() => _$OAuthRequestToJson(this);
}

@JsonSerializable()
class RefreshTokenRequest {
  final String refreshToken;

  RefreshTokenRequest({required this.refreshToken});

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);
}

@JsonSerializable()
class MemberResponse {
  final int id;
  final String email;
  final String name;
  final String? profileImage;
  final String provider;
  final bool isActive;
  final String? lastLoginAt;

  MemberResponse({
    required this.id,
    required this.email,
    required this.name,
    this.profileImage,
    required this.provider,
    required this.isActive,
    this.lastLoginAt,
  });

  factory MemberResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MemberResponseToJson(this);
}

@JsonSerializable()
class AuthResponse {
  final String accessToken;
  final String refreshToken;
  final MemberResponse member;

  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.member,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
