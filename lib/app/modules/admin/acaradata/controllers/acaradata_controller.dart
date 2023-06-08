import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/data/dataacara.dart';

import '../../../../routes/app_pages.dart';

class AcaradataController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamAcara() async* {
    yield* await firestore.collection("Acara WBJ").snapshots();
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.BOTTOMNAVU);
  }

  void deleteAcara(ModeldataAcara dataAcara) async {
    try {
      final storage = FirebaseStorage.instance.refFromURL(dataAcara.imageFile);
      await storage.delete();
      await firestore.collection("Acara WBJ").doc(dataAcara.id).delete();
      Get.snackbar("Berhasil", "Data Acara Berhasil di Hapus",
      colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);
    } catch (e) {
      print(e);
      Get.snackbar("Terjadi Kesalahan", "message");
    }
  }
}
