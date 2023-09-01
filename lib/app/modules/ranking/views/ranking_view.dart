import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ranking_controller.dart';

class RankingView extends GetView<RankingController> {
  const RankingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RankingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RankingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
