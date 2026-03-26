import 'dart:io';
import '../../core/network/dio_client.dart';
import '../../core/network/base_response.dart';
import '../models/meal_models.dart';
import '../network/meal_api_client.dart';

class MealRepository {
  final MealApiClient _apiClient;

  MealRepository() : _apiClient = MealApiClient(DioClient().dio);

  Future<BaseResponse<MealData>> createMeal(File photo, String mealType) {
    return _apiClient.createMeal(photo, mealType);
  }

  Future<BaseResponse<PaginatedContent<MealData>>> getMeals({
    String? startDate,
    String? endDate,
    String? mealType,
    int? page,
    int? size,
  }) {
    return _apiClient.getMeals(startDate, endDate, mealType, page, size);
  }

  Future<BaseResponse<MealDetailData>> getMeal(int id) {
    return _apiClient.getMeal(id);
  }

  Future<BaseResponse<void>> deleteMeal(int id) {
    return _apiClient.deleteMeal(id);
  }

  Future<BaseResponse<MealData>> retakePhoto(int id, File photo) {
    return _apiClient.retakePhoto(id, photo);
  }
}
