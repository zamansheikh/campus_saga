import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Campus Saga',
          style: TextStyle(fontFamily: 'Boogaloo'),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [IconButton(onPressed: () {}, icon: Icon(Icons.abc))],
      ),
    );
  }
}
