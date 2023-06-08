import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
 PageController pageController = PageController(viewportFraction: 0.85);
  
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  
  Stream<QuerySnapshot<Map<String, dynamic>>> streamAcara()async*{
   yield* await firestore.collection("Acara WBJ").snapshots();
   
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> menuHomeStream()async*{
   yield* await firestore.collection("Menu WBJ").where("Rekomendasi",isEqualTo: true).snapshots();
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> streamProfil()async*{
   yield* await firestore.collection("Profil WBJ").snapshots();
  }
}
