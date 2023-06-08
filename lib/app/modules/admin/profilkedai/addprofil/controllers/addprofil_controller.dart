import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddprofilController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController namaC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController jamC = TextEditingController();
  TextEditingController deskripsiC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  XFile? image;

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      update();
    }
  }

  void addProfilWbj() async {
    if (namaC.text.isNotEmpty &&
        alamatC.text.isNotEmpty &&
        jamC.text.isNotEmpty&&
        image!=null) {
      isLoading.value = true;
      try {
        
        if (image != null) {
          String name = image!.name;

          await storage
              .ref("Profil WBJ")
              .child(name)
              .putFile(File(image!.path));
          String profilGaleri =
            await storage.ref("Profil WBJ").child(name).getDownloadURL();
            await firestore.collection("Profil WBJ").add({
            "Nama": namaC.text,
            "Alamat": alamatC.text,
            "Jam": jamC.text,
            "deskripsi": deskripsiC.text,
            "Image": profilGaleri,
          });
        }
        isLoading.value = false;
        
        Get.back();
        Get.snackbar('Berhasil', 'Data profil berhasil di tambahkan',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);
      } catch (e) {
        print(e);
        isLoading.value = false;
        Get.snackbar("TERJADI KESALAHAN", "Tidak dapat menambahkan profil.");
      }
    } else {
      Get.snackbar("TERJADI KESALAHAN", "Semua data wajib diisi",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF4E342E));
    }
  }
}
