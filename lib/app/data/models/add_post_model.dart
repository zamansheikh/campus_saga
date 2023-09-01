class AddPost {
  String? id;
  String? userId;
  String? userName;
  String? heading;
  String? description;
  String? imageUrl;
  bool? isSolved;
  int? upvotes;
  int? downvotes;
  String? adminFeedback;
  bool? userAgreesToFeedback;
  dynamic problemHeading;
  dynamic problemDescription;
  dynamic userAvatar;

  AddPost(
      {this.id,
      this.userId,
      this.userName,
      this.heading,
      this.description,
      this.imageUrl,
      this.isSolved,
      this.upvotes,
      this.downvotes,
      this.adminFeedback,
      this.userAgreesToFeedback,
      this.problemHeading,
      this.problemDescription,
      this.userAvatar});

  AddPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    userName = json['userName'];
    heading = json['heading'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    isSolved = json['isSolved'];
    upvotes = json['upvotes'];
    downvotes = json['downvotes'];
    adminFeedback = json['adminFeedback'];
    userAgreesToFeedback = json['userAgreesToFeedback'];
    problemHeading = json['problemHeading'];
    problemDescription = json['problemDescription'];
    userAvatar = json['userAvatar'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['userName'] = userName;
    data['heading'] = heading;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['isSolved'] = isSolved;
    data['upvotes'] = upvotes;
    data['downvotes'] = downvotes;
    data['adminFeedback'] = adminFeedback;
    data['userAgreesToFeedback'] = userAgreesToFeedback;
    data['problemHeading'] = problemHeading;
    data['problemDescription'] = problemDescription;
    data['userAvatar'] = userAvatar;
    return data;
  }
}
