import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../data/models/post_model.dart';
import '../../widgets/post_card.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              PostModel post = controller.posts[index];
              return PostCard(post: post);
            },
          );
        }
      }),
    );
  }
}
