import 'package:Campus_Saga/app/data/models/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<UserModel> user = UserModel(department: '', gender: '', name: '', password: '', phoneNumber: '', university: '').obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch user data from a service or storage
    // For example, you can call a service to get the user data
    // user.value = await UserService.fetchUserData();
  }

  void updateUser(UserModel updatedUser) {
    user.value = updatedUser;
  }

  // Add other methods related to profile interactions here
}
