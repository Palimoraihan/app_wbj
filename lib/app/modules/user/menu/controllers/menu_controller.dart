import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuControllers extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMenu() async* {
    yield* await firestore.collection("Menu WBJ").snapshots();
  }
  
}
