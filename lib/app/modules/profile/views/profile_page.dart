import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Name: ${controller.user.name.value}')),
            Obx(() => Text('Email: ${controller.user.email}')),
            Obx(() => Text('Phone: ${controller.user.phone}')),
            Obx(() => Text('University: ${controller.user.university}')),
            Obx(() => Text('Dept: ${controller.user.department}')),
            Obx(() => Text('Gender: ${controller.user.gender}')),
            Obx(() => Text('Verified: ${controller.user.verified}')),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to EditProfilePage
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
