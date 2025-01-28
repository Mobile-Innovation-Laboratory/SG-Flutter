import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  bool isLoading = false;

  // Fitur logout untuk menghapus status login
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', false);
    await prefs.remove('username'); // Menghapus data pengguna
    isLoading = true;

    Get.snackbar('Logged Out', 'You have been logged out');
    Get.offNamed('/login');
  }
}
