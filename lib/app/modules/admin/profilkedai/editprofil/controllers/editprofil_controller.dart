import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class EditprofilController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController namaC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController jamC = TextEditingController();
  TextEditingController deskripsiC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  XFile? image;

  Future<Map<String, dynamic>?> getProfil(String docID) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await firestore.collection("Profil WBJ").doc(docID).get();
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

  void editProfilWbj(String docID) async {
    if (namaC.text.isNotEmpty &&
        alamatC.text.isNotEmpty &&
        jamC.text.isNotEmpty
        ) {
      isLoading.value = true;
      try {
        await firestore.collection("Profil WBJ").doc(docID).update({
            "Nama": namaC.text,
            "Alamat": alamatC.text,
            "Jam": jamC.text,
            "deskripsi": deskripsiC.text,
          });
        if (image != null) {
          String name = image!.name;
          await storage
              .ref("Profil WBJ")
              .child(name)
              .putFile(File(image!.path));
          String profilGaleri =
              await storage.ref("Profil WBJ").child(name).getDownloadURL();
              await firestore.collection("Profil WBJ").doc(docID).update({"Image": profilGaleri,
          });
        }
        isLoading.value = false;
        Get.back();
        Get.snackbar('Berhasil', 'Data profil berhasil di Perbarui',
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green);
      } catch (e) {
        print(e);
        isLoading.value = false;
        Get.snackbar("TERJADI KESALAHAN", "Tidak dapat memperbarui menu.");
      }
    } else {
      Get.snackbar("TERJADI KESALAHAN", "Semua wajib diisi",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xFF4E342E));
    }
  }

}
