import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_34/Controller/AuthController.dart';
import 'package:pas1_mobile_11pplg1_34/binding.dart';
import 'package:pas1_mobile_11pplg1_34/pages/HomePage.dart';
import 'package:pas1_mobile_11pplg1_34/pages/LoginPage.dart';
import 'package:pas1_mobile_11pplg1_34/pages/RegisterPage.dart';
import 'package:pas1_mobile_11pplg1_34/pages/TeamDetailPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authController = AuthController();
  await authController.checkLoginStatus();
  runApp(MyApp(authController: authController));
}

class MyApp extends StatelessWidget {
  final AuthController authController;
  MyApp({required this.authController});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(authController); 
      }),
        initialRoute: authController.isLoggedIn.value ? '/homepage' : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/homepage', page: () => Homepage(),binding: Appbinding()),
        GetPage(name: '/register', page: () => RegisterPage(),binding: Appbinding()),
        GetPage(name: '/team-detail', page: () => TeamDetailPage(),binding: Appbinding()),
      ],
    );
  }
}
