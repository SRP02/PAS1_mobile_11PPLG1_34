import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_34/models/Team_models.dart';

class TeamDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TeamModels team = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(team.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(team.image),
            SizedBox(height: 16),
            Text(
              team.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(team.description),
          ],
        ),
      ),
    );
  }
}