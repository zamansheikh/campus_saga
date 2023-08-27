import 'package:get/get.dart';
import '../app/data/models/post_model.dart';

class PostService extends GetxService {
  static PostService get to => Get.find();

  RxList<PostModel> posts = RxList<PostModel>();

  void fetchPosts() {
    // Simulate fetching posts from an API or database
    // Replace this with your actual data fetching logic
    List<PostModel> fetchedPosts = [
      PostModel(
        id: "1",
        title: 'Sample Post 1',
        description: 'This is the first sample post description.',
        heading: '',
        imageUrl: '',
        userId: '',
        userName: '',
        problemDescription: '',
        problemHeading: '',
        userAvatar: '',
      ),
      PostModel(
        id: "2",
        title: 'Sample Post 1',
        description: 'This is the first sample post description.',
        heading: '',
        imageUrl: '',
        userId: '',
        userName: '',
        problemDescription: '',
        problemHeading: '',
        userAvatar: '',
      ),
      // Add more posts here
    ];

    posts.assignAll(fetchedPosts);
  }

  void addPost(PostModel post) {
    // Simulate adding a new post
    // Replace this with your actual post creation logic
    posts.add(post);
  }

  void markPostAsSolved(int postId) {
    // Simulate marking a post as solved
    // Replace this with your actual post update logic
    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      posts[postIndex].isSolved = true;
    }
  }

  // Add more methods for editing and deleting posts as needed
}
