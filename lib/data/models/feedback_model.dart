// feedback_model.dart
import 'package:campus_saga/domain/entities/feedback.dart';

class FeedbackModel {
  final String id;
  final String authorityId;
  final String postId;
  final String message;
  final bool resolved;
  final int agreeCount;
  final int disagreeCount;
  final DateTime timestamp;

  const FeedbackModel({
    required this.id,
    required this.authorityId,
    required this.postId,
    required this.message,
    this.resolved = false,
    this.agreeCount = 0,
    this.disagreeCount = 0,
    required this.timestamp,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        id: json['id'] as String,
        authorityId: json['authorityId'] as String,
        postId: json['postId'] as String,
        message: json['message'] as String,
        resolved: json['resolved'] as bool? ?? false,
        agreeCount: json['agreeCount'] as int? ?? 0,
        disagreeCount: json['disagreeCount'] as int? ?? 0,
        timestamp: DateTime.parse(json['timestamp'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'authorityId': authorityId,
        'postId': postId,
        'message': message,
        'resolved': resolved,
        'agreeCount': agreeCount,
        'disagreeCount': disagreeCount,
        'timestamp': timestamp.toIso8601String(),
      };

  factory FeedbackModel.fromEntity(Feedback entity) => FeedbackModel(
        id: entity.id,
        authorityId: entity.authorityId,
        postId: entity.postId,
        message: entity.message,
        resolved: entity.resolved,
        agreeCount: entity.agreeCount,
        disagreeCount: entity.disagreeCount,
        timestamp: entity.timestamp,
      );

  Feedback toEntity() => Feedback(
        id: id,
        authorityId: authorityId,
        postId: postId,
        message: message,
        resolved: resolved,
        agreeCount: agreeCount,
        disagreeCount: disagreeCount,
        timestamp: timestamp,
      );

  FeedbackModel copyWith({
    String? id,
    String? authorityId,
    String? postId,
    String? message,
    bool? resolved,
    int? agreeCount,
    int? disagreeCount,
    DateTime? timestamp,
  }) =>
      FeedbackModel(
        id: id ?? this.id,
        authorityId: authorityId ?? this.authorityId,
        postId: postId ?? this.postId,
        message: message ?? this.message,
        resolved: resolved ?? this.resolved,
        agreeCount: agreeCount ?? this.agreeCount,
        disagreeCount: disagreeCount ?? this.disagreeCount,
        timestamp: timestamp ?? this.timestamp,
      );
}