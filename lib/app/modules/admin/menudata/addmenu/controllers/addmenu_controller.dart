import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddmenuController extends GetxController {
  bool isRekomedasi = false;
  RxBool isLoading = false.obs;
  TextEditingController id = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController hargaC = TextEditingController();
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

 

  void rekomend() {
    isRekomedasi = !isRekomedasi;
    update();
  }

  void addMenuWbj() async {
    if (namaC.text.isNotEmpty &&
        hargaC.text.isNotEmpty &&
        deskripsiC.text.isNotEmpty &&
        image != null) {
      isLoading.value = true;
      try {
        if (image != null) {
          String name = image!.name;
          await storage
              .ref("Menu Galeri")
              .child(name)
              .putFile(File(image!.path));
          String menuGaleri =
            await storage.ref("Menu Galeri").child(name).getDownloadURL();
            await firestore.collection("Menu WBJ").doc(id.text).set({
            "Id Menu": id.text,
            "Nama": namaC.text,
            "Harga": hargaC.text,
            "Rekomendasi": isRekomedasi,
            "deskripsi": deskripsiC.text,
            "Foto Menu": menuGaleri,
          });
          
        }
        isLoading.value = false;
        Get.back();
        Get.snackbar('Berhasil', 'Data Menu berhasil di tambahkan',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);
      } catch (e) {
        print(e);
        isLoading.value = false;
        Get.snackbar("TERJADI KESALAHAN", "Tidak dapat menambahkan menu");
      }
    } else {
      Get.snackbar("TERJADI KESALAHAN", "Semua data wajib diisi",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF4E342E));
    }
  }
}
