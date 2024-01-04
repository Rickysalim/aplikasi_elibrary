
import 'package:e_library_nama_elib_mobile/view/screens/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {

  RxBool isLoading = RxBool(false);

  Future<void> setIsViewed(int isView) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('MainScreen', isView);
    Get.offAll(SignInScreen());
  }

  
}
