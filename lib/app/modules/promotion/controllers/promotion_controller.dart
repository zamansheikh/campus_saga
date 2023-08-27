import 'package:Campus_Saga/app/data/models/post_model.dart';
import 'package:get/get.dart';

class PromotionController extends GetxController {
  // Create an observable list to store promotions
  RxList<PostModel> promotions = <PostModel>[].obs;

  @override
  void onInit() {
    // Simulate fetching promotions from a service or database
    fetchPromotions();
    super.onInit();
  }

  void fetchPromotions() {
    // Replace this with actual API/database calls
    // For now, let's add some dummy promotions
    promotions.value = [
      PostModel(
        userAvatar: 'url_to_user_avatar1',
        problemHeading: 'Promotion 1 Heading',
        problemDescription: 'Description for Promotion 1', description: '', heading: '', id: '', imageUrl: '', title: '', userId: '', userName: '',
      ),
       PostModel(
        userAvatar: 'url_to_user_avatar1',
        problemHeading: 'Promotion 1 Heading',
        problemDescription: 'Description for Promotion 1', description: '', heading: '', id: '', imageUrl: '', title: '', userId: '', userName: '',
      ),
      // Add more dummy promotions here
    ];
  }
}
