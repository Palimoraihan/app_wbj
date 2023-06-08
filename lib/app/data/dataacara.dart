import 'package:cloud_firestore/cloud_firestore.dart';

class ModeldataAcara{
  String id;
  String nama;
  String alamat;
  String jam;
  String deskripsi;
  String imageFile;

  ModeldataAcara({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.jam,
    required this.deskripsi,
    required this.imageFile
  });
  factory ModeldataAcara.fromJson(DocumentSnapshot snapshot){
    return ModeldataAcara(
      id:snapshot.id, 
      nama: snapshot['Nama'], 
      alamat: snapshot['Alamat'], 
      jam: snapshot['Jam'], 
      deskripsi: snapshot['Deskripsi'], 
      imageFile: snapshot['Image']);
  }

}