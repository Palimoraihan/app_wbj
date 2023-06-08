import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> streamAddGaleri() async* {
    yield* await firestore.collection("Galeri WBJ").snapshots();
  }
}
