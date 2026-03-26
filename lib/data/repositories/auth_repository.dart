import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/base_response.dart';
import '../models/auth_models.dart';
import '../network/auth_api_client.dart';

class AuthRepository {
  final AuthApiClient _apiClient;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthRepository() : _apiClient = AuthApiClient(DioClient().dio);

  Future<BaseResponse<void>> register(RegisterRequest request) {
    return _apiClient.register(request);
  }

  Future<BaseResponse<AuthResponse>> login(LoginRequest request) async {
    final response = await _apiClient.login(request);
    await _saveTokens(response);
    return response;
  }

  Future<BaseResponse<AuthResponse>> oauthLogin(OAuthRequest request) async {
    final response = await _apiClient.oauthLogin(request);
    await _saveTokens(response);
    return response;
  }

  Future<void> _saveTokens(BaseResponse<AuthResponse> response) async {
    if (response.success && response.data != null) {
      await _storage.write(
        key: 'access_token',
        value: response.data!.accessToken,
      );
      await _storage.write(
        key: 'refresh_token',
        value: response.data!.refreshToken,
      );
    }
  }

  Future<BaseResponse<void>> logout() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    final response = await _apiClient.logout(
      RefreshTokenRequest(refreshToken: refreshToken ?? ''),
    );
    if (response.success) {
      await _storage.delete(key: 'access_token');
      await _storage.delete(key: 'refresh_token');
    }
    return response;
  }

  Future<BaseResponse<void>> withdraw(String reason) async {
    final response = await _apiClient.withdraw({'reason': reason});
    if (response.success) {
      await _storage.delete(key: 'access_token');
      await _storage.delete(key: 'refresh_token');
    }
    return response;
  }
}
