import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/modules/buttonnava/views/buttonnava_view.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/halfmedium.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/smalltxt.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 50,
                      color: Color(0xFFC79C60),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Smalltext(
                    text: "Masukan email dan pasword",
                    color: Color(0xFFccc7c5),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 250,
              child: Image.asset("assets/image/Vector_login_wbj.png",fit: BoxFit.contain,),
            ),
            Container(
               margin: EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                   
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Color(0xFFC79C60).withOpacity(0.35),
                              borderRadius: BorderRadius.circular(25)),
                          child: TextField(
                            controller: controller.emailIn,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.brown,
                                ),
                                hintText: "Email",
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Color(0xFFC79C60).withOpacity(0.35),
                              borderRadius: BorderRadius.circular(25)),
                          child: TextField(
                            obscureText: true,
                            controller: controller.passIn,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.brown,
                                ),
                                hintText: "Password",
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                 Obx(() => Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: controller.isLoading.isFalse? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(250, 35),
                            primary: Color(0xFFC79C60)),
                        onPressed: () {
                          if(controller.isLoading.isFalse){
                            controller.login();
                            
                          }
                        },
                        child: Halfmedium(
                          text: "LOGIN",
                          color: Colors.white,
                        )
                      ):CircularProgressIndicator(color: Colors.black,)
                    ),
                  ),
                )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
