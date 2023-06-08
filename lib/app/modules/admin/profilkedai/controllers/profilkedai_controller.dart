import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:warkopbangjago_aplikasi/app/data/dataprofil.dart';
import 'package:warkopbangjago_aplikasi/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilkedaiController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
   FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamProfil()async*{
   yield* await firestore.collection("Profil WBJ").snapshots();
  }
  
  void logout()async{
    await auth.signOut();
      Get.offAllNamed(Routes.BOTTOMNAVU); 
  }
  void deleteProfil(ModeldataProfil dataprofil) async {
    try {
      final storage = FirebaseStorage.instance.refFromURL(dataprofil.imageFile);
      await storage.delete();
      await firestore.collection("Profil WBJ").doc(dataprofil.idDoc).delete();
      Get.snackbar('Berhasil', 'Data Profil Berhasil di Hapus',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar("Terjadi Kesalahan", "message");
    }

  }
}
