import 'package:e_library_nama_elib_mobile/firebase/firebase_options.dart';
import 'package:e_library_nama_elib_mobile/get_x/guards/user_guards_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(UserGuardsController()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // initialRoute: isviewed != 0 ? MainScreen.id : SignInScreen.id,
        // getPages: [
        //   GetPage(
        //     name: SignInScreen.id,
        //     page: () => SignInScreen(),
        //   ),
        //   GetPage(
        //     name: SignUpScreen.id,
        //     page: () => SignUpScreen(),
        //   ),
        //   GetPage(
        //     name: LandingScreen.id,
        //     page: () => LandingScreen(),
        //   ),
        //   GetPage(
        //     name: MainScreen.id,
        //     page: () => MainScreen(),
        //   ),
        //   GetPage(
        //     name: BookListScreen.id,
        //     page: () => BookListScreen(),
        //   ),
        //   GetPage(
        //     name: CategoryScreen.id,
        //     page: () => CategoryScreen(),
        //   ),
        //   GetPage(
        //     name: DetailBookScreen.id,
        //     page: () => DetailBookScreen(ModalRoute.of(context)!.settings.arguments as Book?),
        //   ),
        //   GetPage(
        //     name: ProfileScreen.id,
        //     page: () => ProfileScreen(),
        //   ),
        // ],
        home: Scaffold(
            backgroundColor: Color.fromRGBO(77, 67, 187, 1),
            body: Align(
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/icon.png',
                          width: 300, height: 300),
                      CircularProgressIndicator()
                    ]))));
    // routes: {
    //   ShareLink.id: (context) => ShareLink(),
    //   MainScreen.id: (context) => MainScreen(),
    //   ProfileScreen.id: (context) => ProfileScreen(),
    //   SettingScreen.id: (context) => SettingScreen(),
    //   CategoryScreen.id: (context) => CategoryScreen(),
    //   BookListScreen.id: (context) => BookListScreen(),
    //   SignInScreen.id: (context) => SignInScreen(),
    //   SignUpScreen.id: (context) => SignUpScreen(),
    //   LandingScreen.id: (context) => LandingScreen(),
    //   DetailBookScreen.id: (context) => DetailBookScreen(
    //       ModalRoute.of(context)!.settings.arguments as Book?),
    // },
  }
}
