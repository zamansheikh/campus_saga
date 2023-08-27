import 'package:get/get.dart';

class AuthenticationService extends GetxService {
  RxBool isLoggedIn = false.obs; // Observable to track login status

  Future<void> login(String phoneNumber, String password) async {
    // Implement your login logic here
    // Set isLoggedIn to true if login is successful
    isLoggedIn.value = true;
  }

  Future<void> logout() async {
    // Implement your logout logic here
    // Set isLoggedIn to false
    isLoggedIn.value = false;
  }
}

// Usage:
// AuthenticationService authService = Get.find<AuthenticationService>();
