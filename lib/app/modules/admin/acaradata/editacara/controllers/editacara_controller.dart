import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditacaraController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController namaC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController jamC = TextEditingController();
  TextEditingController deskripsiC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  XFile? image;

  Future<Map<String, dynamic>?> getAcara(String docID) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await firestore.collection("Acara WBJ").doc(docID).get();
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

  void editAcaraWbj(String docID) async {
    if (namaC.text.isNotEmpty &&
        alamatC.text.isNotEmpty &&
        jamC.text.isNotEmpty&&
        deskripsiC.text.isNotEmpty
        ) {
      isLoading.value = true;
      try {
        await firestore.collection("Acara WBJ").doc(docID).update({
            "Nama": namaC.text,
            "Alamat": alamatC.text,
            "Jam": jamC.text,
            "Deskripsi": deskripsiC.text,
          });
        if (image != null) {
          String name = image!.name;
          await storage
              .ref("Acara Image WBJ")
              .child(name)
              .putFile(File(image!.path));
          String acaraGaleri =
              await storage.ref("Acara Image WBJ").child(name).getDownloadURL();
              await firestore.collection("Acara WBJ").doc(docID).update({"Image": acaraGaleri,
          });
        }
        isLoading.value = false;
        Get.back();
        Get.snackbar('Berhasil', 'Data acara berhasil di Perbarui',
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green);
      } catch (e) {
        print(e);
        isLoading.value = false;
        Get.snackbar("TERJADI KESALAHAN", "Tidak dapat memperbarui acara.");
      }
    } else {
      Get.snackbar("TERJADI KESALAHAN", "Semua data wajib diisi",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF4E342E));
    }
  }
}
