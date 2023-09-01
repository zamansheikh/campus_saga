import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_post_controller.dart';

class AddPostView extends GetView<AddPostController> {
  const AddPostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddPostView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddPostView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
