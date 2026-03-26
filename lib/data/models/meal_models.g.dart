// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealData _$MealDataFromJson(Map<String, dynamic> json) => MealData(
  id: (json['id'] as num).toInt(),
  mealType: json['mealType'] as String,
  mealTime: json['mealTime'] as String,
  photoUrl: json['photoUrl'] as String,
  hasReaction: json['hasReaction'] as bool,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$MealDataToJson(MealData instance) => <String, dynamic>{
  'id': instance.id,
  'mealType': instance.mealType,
  'mealTime': instance.mealTime,
  'photoUrl': instance.photoUrl,
  'hasReaction': instance.hasReaction,
  'createdAt': instance.createdAt,
};

MealDetailData _$MealDetailDataFromJson(Map<String, dynamic> json) =>
    MealDetailData(
      id: (json['id'] as num).toInt(),
      mealType: json['mealType'] as String,
      mealTime: json['mealTime'] as String,
      photoUrl: json['photoUrl'] as String,
      hasReaction: json['hasReaction'] as bool,
      createdAt: json['createdAt'] as String,
      aiAnalysis: json['aiAnalysis'] == null
          ? null
          : AIAnalysisData.fromJson(json['aiAnalysis'] as Map<String, dynamic>),
      reaction: json['reaction'] == null
          ? null
          : ReactionData.fromJson(json['reaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MealDetailDataToJson(MealDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mealType': instance.mealType,
      'mealTime': instance.mealTime,
      'photoUrl': instance.photoUrl,
      'hasReaction': instance.hasReaction,
      'createdAt': instance.createdAt,
      'aiAnalysis': instance.aiAnalysis,
      'reaction': instance.reaction,
    };

AIAnalysisData _$AIAnalysisDataFromJson(Map<String, dynamic> json) =>
    AIAnalysisData(
      mealName: json['mealName'] as String?,
      calories: (json['calories'] as num?)?.toDouble(),
      nutrients: json['nutrients'] == null
          ? null
          : NutrientsData.fromJson(json['nutrients'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      confidence: (json['confidence'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AIAnalysisDataToJson(AIAnalysisData instance) =>
    <String, dynamic>{
      'mealName': instance.mealName,
      'calories': instance.calories,
      'nutrients': instance.nutrients,
      'tags': instance.tags,
      'confidence': instance.confidence,
    };

NutrientsData _$NutrientsDataFromJson(Map<String, dynamic> json) =>
    NutrientsData(
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      fiber: (json['fiber'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NutrientsDataToJson(NutrientsData instance) =>
    <String, dynamic>{
      'carbohydrates': instance.carbohydrates,
      'protein': instance.protein,
      'fat': instance.fat,
      'fiber': instance.fiber,
    };

ReactionData _$ReactionDataFromJson(Map<String, dynamic> json) => ReactionData(
  id: (json['id'] as num).toInt(),
  mealId: (json['mealId'] as num).toInt(),
  digestionLevel: (json['digestionLevel'] as num).toInt(),
  fullnessLevel: (json['fullnessLevel'] as num).toInt(),
  energyLevel: (json['energyLevel'] as num).toInt(),
  hasHeartburn: json['hasHeartburn'] as bool,
  hasGas: json['hasGas'] as bool,
  hasBloating: json['hasBloating'] as bool,
  hasHeadache: json['hasHeadache'] as bool,
  memo: json['memo'] as String?,
  overallScore: (json['overallScore'] as num?)?.toDouble(),
  grade: json['grade'] as String?,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$ReactionDataToJson(ReactionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mealId': instance.mealId,
      'digestionLevel': instance.digestionLevel,
      'fullnessLevel': instance.fullnessLevel,
      'energyLevel': instance.energyLevel,
      'hasHeartburn': instance.hasHeartburn,
      'hasGas': instance.hasGas,
      'hasBloating': instance.hasBloating,
      'hasHeadache': instance.hasHeadache,
      'memo': instance.memo,
      'overallScore': instance.overallScore,
      'grade': instance.grade,
      'createdAt': instance.createdAt,
    };

PaginationData _$PaginationDataFromJson(Map<String, dynamic> json) =>
    PaginationData(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      first: json['first'] as bool,
      last: json['last'] as bool,
    );

Map<String, dynamic> _$PaginationDataToJson(PaginationData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'first': instance.first,
      'last': instance.last,
    };

PaginatedContent<T> _$PaginatedContentFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedContent<T>(
  content: (json['content'] as List<dynamic>).map(fromJsonT).toList(),
  pagination: PaginationData.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PaginatedContentToJson<T>(
  PaginatedContent<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'content': instance.content.map(toJsonT).toList(),
  'pagination': instance.pagination,
};
