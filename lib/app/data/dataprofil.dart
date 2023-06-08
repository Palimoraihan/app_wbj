

import 'package:cloud_firestore/cloud_firestore.dart';

class ModeldataProfil{
  String idDoc;
  String nama;
  String alamat;
  String jam;
  String deskripsi;
  String imageFile;

  ModeldataProfil({
    required this.idDoc,
    required this.nama,
    required this.alamat,
    required this.jam,
    required this.deskripsi,
    required this.imageFile
  });
  factory ModeldataProfil.fromJson(DocumentSnapshot snapshot){
    return ModeldataProfil(
      idDoc:snapshot.id, 
      nama: snapshot['Nama'], 
      alamat: snapshot['Alamat'], 
      jam: snapshot['Jam'], 
      deskripsi: snapshot['deskripsi'], 
      imageFile: snapshot['Image']);
  }

}