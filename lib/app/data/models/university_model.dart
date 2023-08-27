class UniversityModel {
  final String id;
  final String name;
  final String logoUrl;
  int totalPosts;
  int totalSolvedPosts;
  int totalUpvotes;
  int totalResponseTime; // in minutes

  UniversityModel({
    required this.id,
    required this.name,
    required this.logoUrl,
    this.totalPosts = 0,
    this.totalSolvedPosts = 0,
    this.totalUpvotes = 0,
    this.totalResponseTime = 0, required int score,
  });

  get totalScore => null;
}
