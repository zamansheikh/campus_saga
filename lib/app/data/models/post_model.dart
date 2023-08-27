import 'package:get/get.dart';

class PostModel {
  final String id;
  final String userId;
  final String userName;
  final String heading;
  final String description;
  final String imageUrl;
  bool isSolved;
  int upvotes;
  int downvotes;
  List<String> adminFeedback;
  bool userAgreesToFeedback;

  PostModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.heading,
    required this.description,
    required this.imageUrl,
    this.isSolved = false,
    this.upvotes = 0,
    this.downvotes = 0,
    this.adminFeedback = const [],
    this.userAgreesToFeedback = false, required String title, required String problemDescription, required String problemHeading, required String userAvatar,
  });

  String get problemHeading => null;

  String get problemDescription => null;

  String get userAvatar => null;

  void markAsSolved() {
    isSolved = true;
  }

  void upvote() {
    upvotes++;
  }

  void downvote() {
    downvotes++;
  }

  void addAdminFeedback(String feedback) {
    adminFeedback.add(feedback);
  }

  void setUserAgreement(bool agree) {
    userAgreesToFeedback = agree;
  }
}
