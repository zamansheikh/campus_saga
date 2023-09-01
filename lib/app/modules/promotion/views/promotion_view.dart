import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/promotion_controller.dart';

class PromotionView extends GetView<PromotionController> {
  const PromotionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PromotionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PromotionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
