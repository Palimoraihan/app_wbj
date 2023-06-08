import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warkopbangjago_aplikasi/app/data/datagaleri.dart';

import '../../../../routes/app_pages.dart';

class GallerydataController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

 Stream<QuerySnapshot<Map<String, dynamic>>> streamAddGaleri()async*{
   yield* await firestore.collection("Galeri WBJ").snapshots();
  } 
  void logout()async{
    await auth.signOut();
      Get.offAllNamed(Routes.BOTTOMNAVU); 
  }

  void deleteGaleri(ModeldataGaleri dataGaleri) async {
    try {
      final storage = FirebaseStorage.instance.refFromURL(dataGaleri.imageFile);
      await storage.delete();
      await firestore.collection("Galeri WBJ").doc(dataGaleri.id).delete();
      Get.snackbar("Berhasil", "Data Geleri Berhasil di Hapus",
      colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar("Terjadi Kesalahan", "Tidak Dapat Mehapus Data");
    }

  }
}
