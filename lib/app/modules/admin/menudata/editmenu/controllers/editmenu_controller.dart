import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:warkopbangjago_aplikasi/app/data/datamenu.dart';

class EditmenuController extends GetxController {

  bool isRekomedasi = false;
  RxBool isLoading = false.obs;
  TextEditingController namaC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
  TextEditingController deskripsiC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  XFile? image;

  Future<Map<String, dynamic>?> getMenu(String docID) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await firestore.collection("Menu WBJ").doc(docID).get();
      return documentSnapshot.data();
    } catch (e) {
      print(e);
      return null;
    }
  }

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      update();
    }
  }

  void editMenuWbj(String docID) async {
    if (namaC.text.isNotEmpty &&
        hargaC.text.isNotEmpty &&
        deskripsiC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await firestore.collection("Menu WBJ").doc(docID).update({
          "Nama": namaC.text,
          "Harga": hargaC.text,
          "Rekomendasi": isRekomedasi,
          "deskripsi": deskripsiC.text,
        });
        if (image != null) {
          
          String name = image!.name;
          await storage
              .ref("Menu Galeri")
              .child(name)
              .putFile(File(image!.path));

          String menuGaleri =
              await storage.ref("Menu Galeri").child(name).getDownloadURL();
          await firestore.collection("Menu WBJ").doc(docID).update({
            "Foto Menu": menuGaleri,
          });
        }
        isLoading.value = false;
        Get.back();
        Get.snackbar('Berhasil', 'Data Menu berhasil di Perbarui',
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green);
      } catch (e) {
        print(e);
        isLoading.value = false;
        Get.snackbar("TERJADI KESALAHAN", "Tidak dapat memperbarui menu.");
      }
    } else {
      Get.snackbar("TERJADI KESALAHAN", "Semua data wajib diisi",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF4E342E));
    }
  }

  void rekomend() {
    isRekomedasi = !isRekomedasi;
    update();
  }
}
