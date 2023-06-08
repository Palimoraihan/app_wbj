import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:warkopbangjago_aplikasi/connetwaiting.dart';


import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  runApp(
    StreamBuilder<User?>(
      stream: auth.authStateChanges() ,
      builder: (context,snap) {
        
        if(snap.connectionState == ConnectionState.waiting){
          return ConnectWaiting();
        }
        return GetMaterialApp(
          title: "WARKOP BANG JAGO",
          debugShowCheckedModeBanner: false,
          initialRoute:snap.data != null? Routes.BUTTONNAVA : Routes.SCREEN_SPLASH,
          getPages: AppPages.routes,
        );
      }
    ),
  );
}
