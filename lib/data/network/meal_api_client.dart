import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:io';
import '../models/meal_models.dart';
import '../../core/network/base_response.dart';

part 'meal_api_client.g.dart';

@RestApi()
abstract class MealApiClient {
  factory MealApiClient(Dio dio, {String baseUrl}) = _MealApiClient;

  @POST('/meals')
  @MultiPart()
  Future<BaseResponse<MealData>> createMeal(
    @Part(name: 'photo') File photo,
    @Part(name: 'mealType') String mealType,
  );

  @GET('/meals')
  Future<BaseResponse<PaginatedContent<MealData>>> getMeals(
    @Query('startDate') String? startDate,
    @Query('endDate') String? endDate,
    @Query('mealType') String? mealType,
    @Query('page') int? page,
    @Query('size') int? size,
  );

  @GET('/meals/{id}')
  Future<BaseResponse<MealDetailData>> getMeal(@Path('id') int id);

  @DELETE('/meals/{id}')
  Future<BaseResponse<void>> deleteMeal(@Path('id') int id);

  @POST('/meals/{id}/photo')
  @MultiPart()
  Future<BaseResponse<MealData>> retakePhoto(
    @Path('id') int id,
    @Part(name: 'photo') File photo,
  );
}
