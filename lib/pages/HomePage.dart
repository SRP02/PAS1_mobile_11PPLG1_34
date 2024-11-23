import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_34/Controller/BottomNavController.dart';
import 'package:pas1_mobile_11pplg1_34/screens/EnglishLeague.dart';
import 'package:pas1_mobile_11pplg1_34/screens/Favorite.dart';
import 'package:pas1_mobile_11pplg1_34/screens/Profile.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonNavController = Get.put(BottomNavController());

    final List<Widget> menus = [
      Englishleague(),
      Favorite(),
      Profile(),
    ];

    return Obx(()=>Scaffold(
        body: menus[buttonNavController.selectedIndex.value],
        bottomNavigationBar: FlashyTabBar(
          selectedIndex: buttonNavController.selectedIndex.value,
          showElevation: true,
          onItemSelected: (index) => buttonNavController.changeIndexMenu(index),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.sports),
              title: Text('Premier League'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
        ),
      ));
    }
}