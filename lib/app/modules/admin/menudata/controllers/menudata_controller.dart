import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warkopbangjago_aplikasi/app/data/datamenu.dart';

import '../../../../routes/app_pages.dart';

class MenudataController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamAddMenu()async*{
    yield* await firestore.collection("Menu WBJ").snapshots();

  } 

  void logout()async{
    await auth.signOut();
      Get.offAllNamed(Routes.BOTTOMNAVU); 
  }
  void deleteMenu(ModeldataMennu dataMenu) async {
    try {
      final storage = FirebaseStorage.instance.refFromURL(dataMenu.imageFile);
      await storage.delete();
      await firestore.collection("Menu WBJ").doc(dataMenu.id).delete();
      Get.snackbar("Berhasil", "Data Menu Berhasil di Hapus",
      colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar("Terjadi Kesalahan", "Tidak dapat mehapus menu");
    }

  }
}
