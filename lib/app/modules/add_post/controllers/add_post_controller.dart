import 'package:get/get.dart';

class AddPostController extends GetxController {
  RxString postType = 'Problem'.obs;
  RxString postTitle = ''.obs;
  RxString postDescription = ''.obs;

  void setPostType(String value) {
    postType.value = value;
  }

  void setPostTitle(String value) {
    postTitle.value = value;
  }

  void setPostDescription(String value) {
    postDescription.value = value;
  }

  void submitPost() {
    // Add logic here to submit the post to a service or repository
    // You can access the values using postType.value, postTitle.value, postDescription.value
    // For example, you might want to call a service to add the post and navigate back to the home page
  }
}
