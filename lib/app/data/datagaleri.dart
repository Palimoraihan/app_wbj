import 'package:cloud_firestore/cloud_firestore.dart';

class ModeldataGaleri {
  String id;
  String imageFile;

  ModeldataGaleri ({
    required this.id,
    required this.imageFile
  });

  factory ModeldataGaleri.fromJson(DocumentSnapshot snapshot ){
    return ModeldataGaleri(
      id: snapshot.id,
      imageFile: snapshot["Image Galeri"]);
  }
}