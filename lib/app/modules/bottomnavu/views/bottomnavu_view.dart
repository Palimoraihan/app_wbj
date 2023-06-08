import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/modules/login/views/login_view.dart';
import '../../user/gallery/views/gallery_view.dart';
import '../../user/home/views/home_view.dart';
import '../../user/menu/views/menu_view.dart';
import '../controllers/bottomnavu_controller.dart';

class BottomnavuView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark ));
    return GetBuilder<BottomnavuController>(builder: (controller){
      return Scaffold(
      body:  IndexedStack(
          index: controller.idxtab,
          children: [
            HomeView(),
            MenuView(),
            GalleryView(),
            LoginView()
          ],),
      
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xFFccc7c5),
        selectedItemColor: Color(0xFFC79C60),
        onTap: controller.selectNav,
        currentIndex: controller.idxtab,
        items: [
        _bottomNav(icond: Icons.home, labeld: "BERANDA",),
        _bottomNav(icond: Icons.menu_book,labeld: "MENU"),
        _bottomNav(icond: Icons.photo_album, labeld: "GALERI"),
        _bottomNav(icond: Icons.person,labeld: "LOGIN"),
      ]),
    );
    }
    );
  }

  _bottomNav({IconData? icond, required String labeld}) {
    return BottomNavigationBarItem(icon: Icon(icond), label: labeld);
  }
}
