import 'package:json_annotation/json_annotation.dart';

part 'meal_models.g.dart';

@JsonSerializable()
class MealData {
  final int id;
  final String mealType; // 'BREAKFAST', 'LUNCH', 'DINNER', 'SNACK'
  final String mealTime;
  final String photoUrl;
  final bool hasReaction;
  final String createdAt;

  MealData({
    required this.id,
    required this.mealType,
    required this.mealTime,
    required this.photoUrl,
    required this.hasReaction,
    required this.createdAt,
  });

  factory MealData.fromJson(Map<String, dynamic> json) =>
      _$MealDataFromJson(json);
  Map<String, dynamic> toJson() => _$MealDataToJson(this);
}

@JsonSerializable()
class MealDetailData extends MealData {
  final AIAnalysisData? aiAnalysis;
  final ReactionData? reaction;

  MealDetailData({
    required super.id,
    required super.mealType,
    required super.mealTime,
    required super.photoUrl,
    required super.hasReaction,
    required super.createdAt,
    this.aiAnalysis,
    this.reaction,
  });

  factory MealDetailData.fromJson(Map<String, dynamic> json) =>
      _$MealDetailDataFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MealDetailDataToJson(this);
}

@JsonSerializable()
class AIAnalysisData {
  final String? mealName;
  final double? calories;
  final NutrientsData? nutrients;
  final List<String>? tags;
  final double? confidence;

  AIAnalysisData({
    this.mealName,
    this.calories,
    this.nutrients,
    this.tags,
    this.confidence,
  });

  factory AIAnalysisData.fromJson(Map<String, dynamic> json) =>
      _$AIAnalysisDataFromJson(json);
  Map<String, dynamic> toJson() => _$AIAnalysisDataToJson(this);
}

@JsonSerializable()
class NutrientsData {
  final double? carbohydrates;
  final double? protein;
  final double? fat;
  final double? fiber;

  NutrientsData({
    this.carbohydrates,
    this.protein,
    this.fat,
    this.fiber,
  });

  factory NutrientsData.fromJson(Map<String, dynamic> json) =>
      _$NutrientsDataFromJson(json);
  Map<String, dynamic> toJson() => _$NutrientsDataToJson(this);
}

@JsonSerializable()
class ReactionData {
  final int id;
  final int mealId;
  final int digestionLevel;
  final int fullnessLevel;
  final int energyLevel;
  final bool hasHeartburn;
  final bool hasGas;
  final bool hasBloating;
  final bool hasHeadache;
  final String? memo;
  final double? overallScore;
  final String? grade;
  final String createdAt;

  ReactionData({
    required this.id,
    required this.mealId,
    required this.digestionLevel,
    required this.fullnessLevel,
    required this.energyLevel,
    required this.hasHeartburn,
    required this.hasGas,
    required this.hasBloating,
    required this.hasHeadache,
    this.memo,
    this.overallScore,
    this.grade,
    required this.createdAt,
  });

  factory ReactionData.fromJson(Map<String, dynamic> json) =>
      _$ReactionDataFromJson(json);
  Map<String, dynamic> toJson() => _$ReactionDataToJson(this);
}

@JsonSerializable()
class PaginationData {
  final int page;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;

  PaginationData({
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.first,
    required this.last,
  });

  factory PaginationData.fromJson(Map<String, dynamic> json) =>
      _$PaginationDataFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationDataToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class PaginatedContent<T> {
  final List<T> content;
  final PaginationData pagination;

  PaginatedContent({
    required this.content,
    required this.pagination,
  });

  factory PaginatedContent.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginatedContentFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PaginatedContentToJson(this, toJsonT);
}
