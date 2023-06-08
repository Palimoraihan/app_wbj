import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/routes/app_pages.dart';

import '../controllers/screen_splash_controller.dart';

class ScreenSplashView extends GetView<ScreenSplashController> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () => Get.toNamed(Routes.BOTTOMNAVU));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 150, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              
              height: 300,
              child: Image.asset("assets/image/logo_wbj.jpg",fit: BoxFit.cover,
              )
            ),
           
            CircularProgressIndicator(color: Color(0xFF97723F),)
          ],
        ),
      ),
    );
  }
}
