import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:warkopbangjago_aplikasi/app/routes/app_pages.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;
  TextEditingController emailIn = TextEditingController();
  // text: 'warkopbangjago@gmail.com'
  TextEditingController passIn = TextEditingController();
  // text: 'wbj123'

  void login() async {
    if(emailIn.text.isNotEmpty&& passIn.text.isNotEmpty){
    try {
      isLoading.value = true;
      final credential = await auth.signInWithEmailAndPassword(
        email: emailIn.text,
        password: passIn.text,
      );
      print(credential);

      isLoading.value = false;
      Get.offAllNamed(Routes.BUTTONNAVA);
      Get.snackbar('Berhasil', 'Login berhasil',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      print(e.code);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');

        Get.snackbar('TERJADI KESALAHAN', 'Pengguna belum bisa login untuk saat ini',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red);

      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar('TERJADI KESALAHAN', 'Password salah',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red);
      }
    }
    
  }else{
    Get.snackbar('TERJADI KESALAHAN', 'Email dan password wajib di isi',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red);
  }
  }
}
