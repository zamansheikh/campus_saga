import 'package:Campus_Saga/app/modules/promotion/controllers/promotion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromotionPage extends StatelessWidget {
  final PromotionController _controller = Get.find<PromotionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotion Page'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _controller.promotions.length,
          itemBuilder: (context, index) {
            final promotion = _controller.promotions[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(promotion.userAvatar),
              ),
              title: Text(promotion.problemHeading),
              subtitle: Text(promotion.problemDescription),
              // You can add more widgets here to display other promotion details
            );
          },
        ),
      ),
    );
  }
}
