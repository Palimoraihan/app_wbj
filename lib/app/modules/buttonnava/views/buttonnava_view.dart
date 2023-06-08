import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/modules/admin/acaradata/addacara/views/addacara_view.dart';
import '../../admin/acaradata/views/acaradata_view.dart';
import '../../admin/gallerydata/views/gallerydata_view.dart';
import '../../admin/menudata/views/menudata_view.dart';
import '../../admin/profilkedai/views/profilkedai_view.dart';
import '../controllers/buttonnava_controller.dart';

class ButtonnavaView extends GetView<ButtonnavaController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonnavaController>(builder: (controller){
  
      return Scaffold(
      body: IndexedStack(
        index: controller.idxtaba,
        children: [
          ProfilkedaiView(),
          AcaradataView(),
          MenudataView(),
          GallerydataView()
        ],),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xFFccc7c5),
        selectedItemColor: Color(0xFFC79C60),
        onTap: controller.selectNava,
        currentIndex: controller.idxtaba,
        items: [
        _bottomNav(icond: Icons.store, labeld: "PROFILD",),
        _bottomNav(icond: Icons.event_note,labeld: "ACARAD"),
        _bottomNav(icond: Icons.menu_book,labeld: "MENUD"),
        _bottomNav(icond: Icons.photo_filter,labeld: "GALERID"),
      ]),
    );
    });
  }

  _bottomNav({IconData? icond, required String labeld}) {
    return BottomNavigationBarItem(icon: Icon(icond), label: labeld);
  }
}
