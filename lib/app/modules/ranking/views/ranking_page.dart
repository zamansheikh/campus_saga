import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/ranking_controller.dart';

class RankingPage extends StatelessWidget {
  final RankingController _rankingController = Get.put(RankingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking'),
      ),
      body: Center(
        child: Obx(
          () => ListView.builder(
            itemCount: _rankingController.universities.length,
            itemBuilder: (context, index) {
              final university = _rankingController.universities[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(university.logoUrl),
                ),
                title: Text(university.name),
                subtitle: Text('Score: ${university.totalScore.toString()}'),
                onTap: () {
                  _rankingController.viewUniversityDetails(university);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
