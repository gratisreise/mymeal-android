import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/auth_models.dart';
import '../../core/network/base_response.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String baseUrl}) = _AuthApiClient;

  @POST('/auth/register')
  Future<BaseResponse<void>> register(@Body() RegisterRequest request);

  @POST('/auth/login')
  Future<BaseResponse<AuthResponse>> login(@Body() LoginRequest request);

  @POST('/auth/oauth')
  Future<BaseResponse<AuthResponse>> oauthLogin(@Body() OAuthRequest request);

  @POST('/auth/refresh')
  Future<BaseResponse<AuthResponse>> refreshToken(@Body() RefreshTokenRequest request);

  @POST('/auth/logout')
  Future<BaseResponse<void>> logout(@Body() RefreshTokenRequest request);

  @DELETE('/auth/withdraw')
  Future<BaseResponse<void>> withdraw(@Body() Map<String, dynamic> request);
}
