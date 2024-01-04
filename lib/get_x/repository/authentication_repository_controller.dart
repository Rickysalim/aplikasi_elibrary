import 'package:e_library_nama_elib_mobile/utils/exceptions/signin_exception.dart';
import 'package:e_library_nama_elib_mobile/utils/exceptions/signup_exception.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepositoryController extends GetxController {
  static AuthenticationRepositoryController get instance => Get.find();

  final _auth = FirebaseAuth.instance;

   Future<void> signInWithEmailAndPassword(
        String email, String password) async {
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } on FirebaseAuthException catch (e) {
        final err = SignInWithEmailAndPasswordFailureException.code(e.code);
        throw err;
      } catch (e) {
        final err = SignUpWithEmailAndPasswordFailureException();
        throw err;
      }
    }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      
      final err = SignUpWithEmailAndPasswordFailureException.code(e.code);
      throw err;
    } catch (e) {
      final err = SignUpWithEmailAndPasswordFailureException();
      throw err;
    }

   
  }
}
