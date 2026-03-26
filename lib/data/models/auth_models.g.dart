// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'fcmToken': instance.fcmToken,
    };

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
  email: json['email'] as String,
  password: json['password'] as String,
  fcmToken: json['fcmToken'] as String?,
);

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fcmToken': instance.fcmToken,
    };

OAuthRequest _$OAuthRequestFromJson(Map<String, dynamic> json) => OAuthRequest(
  provider: json['provider'] as String,
  code: json['code'] as String,
  fcmToken: json['fcmToken'] as String?,
);

Map<String, dynamic> _$OAuthRequestToJson(OAuthRequest instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'code': instance.code,
      'fcmToken': instance.fcmToken,
    };

RefreshTokenRequest _$RefreshTokenRequestFromJson(Map<String, dynamic> json) =>
    RefreshTokenRequest(refreshToken: json['refreshToken'] as String);

Map<String, dynamic> _$RefreshTokenRequestToJson(
  RefreshTokenRequest instance,
) => <String, dynamic>{'refreshToken': instance.refreshToken};

MemberResponse _$MemberResponseFromJson(Map<String, dynamic> json) =>
    MemberResponse(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      profileImage: json['profileImage'] as String?,
      provider: json['provider'] as String,
      isActive: json['isActive'] as bool,
      lastLoginAt: json['lastLoginAt'] as String?,
    );

Map<String, dynamic> _$MemberResponseToJson(MemberResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'profileImage': instance.profileImage,
      'provider': instance.provider,
      'isActive': instance.isActive,
      'lastLoginAt': instance.lastLoginAt,
    };

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  member: MemberResponse.fromJson(json['member'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'member': instance.member,
    };
