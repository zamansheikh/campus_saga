import 'package:get/get.dart';

class UserModel extends GetxController {
  late String name;
  late String phoneNumber;
  late String password;
  late String gender;
  late String university;
  late String department;
  bool isVerified = false;

  UserModel({
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.gender,
    required this.university,
    required this.department,
  });

  void setVerificationStatus(bool status) {
    isVerified = status;
    update();
  }
}
