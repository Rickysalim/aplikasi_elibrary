import 'package:e_library_nama_elib_mobile/view/screens/landing_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/main_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserGuardsController extends GetxController {
  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  int? isviewed;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    _setMainScreen();
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(SignInScreen());
    } else {
      Get.offAll(LandingScreen());
    }
  }

  _setMainScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int isviewed = prefs.getInt('MainScreen') ?? 0;
    if (isviewed != 1) {
      Get.off(MainScreen());
    }
  }
}
