import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddgalleryController extends GetxController {
  RxBool isLoading = false.obs;


  final storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  XFile? image;

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      update();
    }
  }

  void addGaleriWbj() async {
    if (image != null) {
      isLoading.value = true;
      try {
        if (image != null) {
          String name = image!.name;

          await storage
              .ref("Galeri Image WBJ")
              .child(name)
              .putFile(File(image!.path));
          String acaraGaleri = await storage
              .ref("Galeri Image WBJ")
              .child(name)
              .getDownloadURL();

          await firestore.collection("Galeri WBJ").add({
            "Image Galeri": acaraGaleri,
          });
        }
        isLoading.value = false;

        Get.back();
        Get.snackbar('Berhasil', 'Data Galeri berhasil di tambahkan',
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green);
      } catch (e) {
        print(e);
        isLoading.value = false;
        Get.snackbar("TERJADI KESALAHAN", "Tidak dapat menambahkan galeri.");
      }
    } else {
      Get.snackbar(
          "TERJADI KESALAHAN", "Semua data wajib diisi",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF4E342E));
    }
  }
}
