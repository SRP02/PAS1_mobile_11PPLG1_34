import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_34/Controller/Team_Controller.dart';
import 'package:pas1_mobile_11pplg1_34/widgets/TeamList.dart';

class Englishleague extends StatelessWidget {
  Englishleague({super.key});
  final TeamController teamController = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return TeamList();}
}