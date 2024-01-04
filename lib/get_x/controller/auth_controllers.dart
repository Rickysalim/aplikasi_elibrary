import 'package:e_library_nama_elib_mobile/get_x/repository/authentication_repository_controller.dart';
import 'package:e_library_nama_elib_mobile/utils/exceptions/signin_exception.dart';
import 'package:e_library_nama_elib_mobile/utils/exceptions/signup_exception.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
 
  final authRepoController = Get.put(AuthenticationRepositoryController());

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final isLoading = false;

  /* 
    final phoneNumber = TextEditingController();
    final photoUrl = TextEditingController();
  */

  void resetText() {
    onLoading();
    email.clear();
    password.clear();
    confirmPassword.clear();
  }

  void onLoading () => !isLoading;

  Future<void> register() async {
    try{
      onLoading();
      await authRepoController.createUserWithEmailAndPassword(email.text, password.text);
      resetText();
    } on SignUpWithEmailAndPasswordFailureException catch (e) {
       Get.snackbar(e.code, e.message);
    }
  }

  Future<void> logout() async {
    try{
      await authRepoController.signOut();
    } catch(e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> login() async {
    try{
      onLoading();
      await authRepoController.signInWithEmailAndPassword(email.text, password.text);
      resetText();
    } on SignInWithEmailAndPasswordFailureException catch (e) {
        Get.snackbar(e.code, e.message);
    }
  }
}


/* 
import 'package:dio/dio.dart' as http;
import 'package:e_library_nama_elib_mobile/config/app_exception.dart';
import 'package:e_library_nama_elib_mobile/utils/dio.dart';
import 'package:e_library_nama_elib_mobile/view/screens/landing_screen.dart';
import 'package:flutter/material.dart';
**/

/* 
class AuthController extends GetxController {
  Future<void> loginWithEmailAndPassword(Map<String, dynamic> data) async {
    try {
      final response = await DioInstance.instance.post('/auth/login',
          data: data);
      final result = returnResponse(response);
      if (result.statusCode == 200) {
        Get.toNamed(LandingScreen.id);
      } else {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(result.message.toString())],
            );
          });
      }
    } on Exception catch (err) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text('Our Service Unavailable Right Now')],
            );
          });
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
        throw UnauthorisedException(response.data.toString());
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
} **/
