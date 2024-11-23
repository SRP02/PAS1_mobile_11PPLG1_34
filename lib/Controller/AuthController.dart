import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pas1_mobile_11pplg1_34/utils/authservice.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var isLoading = false.obs;

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await AuthService().login(username, password);

      if (response.status) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('token', response.token ?? '');
        await prefs.setString('nickname', username);

        isLoggedIn.value = true;

        Get.snackbar(
          "Login Berhasil",
          "Selamat datang, $username",
          snackPosition: SnackPosition.TOP,
        );
        Get.offAllNamed('/homepage'); // Navigasi ke home
      } else {
        Get.snackbar(
          "Login Gagal",
          response.message ?? "Username atau password salah",
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Terjadi kesalahan. Silakan coba lagi.",
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('token');
    await prefs.remove('nickname');

    isLoggedIn.value = false;
    Get.offAllNamed('/homepage');
  }
}
