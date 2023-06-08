import 'package:cloud_firestore/cloud_firestore.dart';

class ModeldataMennu{
  String id;
  String nama;
  String harga;
  String deskripsi;
  bool rekomendasi;
  String imageFile;

  ModeldataMennu({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.rekomendasi,
    required this.imageFile,
  });
  factory ModeldataMennu.fromJson(DocumentSnapshot snapshot){
    ModeldataMennu dataMenu = ModeldataMennu(
      id: snapshot.id,
      nama: snapshot['Nama'], 
      harga: snapshot['Harga'], 
      deskripsi: snapshot['deskripsi'], 
      rekomendasi: snapshot['Rekomendasi'], 
      imageFile:snapshot ['Foto Menu']);
    return dataMenu;
    }
}