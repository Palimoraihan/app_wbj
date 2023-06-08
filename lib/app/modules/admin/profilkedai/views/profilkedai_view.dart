import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/data/dataprofil.dart';
import 'package:warkopbangjago_aplikasi/app/routes/app_pages.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/bigtxt.dart';

import '../../../../widgets/smalltxt.dart';
import '../controllers/profilkedai_controller.dart';
import '../editprofil/views/editprofil_view.dart';

class ProfilkedaiView extends GetView<ProfilkedaiController> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        
        title: Bigtext(
          text: "DATA PROFIL WBJ",
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () => controller.logout(),
              icon: Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              )),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamProfil(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data?.docs.length == 0 || snapshot.data == null) {
              return Center(
                child: Text("Belum Ada Data"),
              );
            }
            print(snapshot.data!.docs);
            ModeldataProfil dataprofil =
                ModeldataProfil.fromJson(snapshot.data!.docs.single);
            return SingleChildScrollView(
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.EDITPROFIL,arguments: dataprofil.idDoc);
                },
                child: Column(
                  children: [
                    Container(
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(dataprofil.imageFile),
                          ),
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 20,),
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: Center(
                            child: Bigtext(
                              text: dataprofil.nama,
                              color: Color(0xFF97723F),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.0,right: 10.0),
                          child: CircleAvatar(
                            child: IconButton(
                                onPressed: () {
                                  controller.deleteProfil(dataprofil);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,

                                ),iconSize: 30,),
                            backgroundColor: Colors.red,
                            radius: 25,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Color(0xFF97723F),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Smalltext(
                                text: dataprofil.jam,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFF97723F),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Smalltext(
                                text: dataprofil.alamat,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        dataprofil.deskripsi,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamProfil(),
          builder: (context, snapshot) {
            return FloatingActionButton(
              heroTag: "fab1",
              onPressed: () {
                snapshot.data?.docs.length == 0
                    ? Get.toNamed(Routes.ADDPROFIL)
                    : Get.snackbar("INFO", "Data Sudah Di Isi",
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Color(0xFF4E342E));
              },
              child: Icon(
                Icons.add,
                size: 40.0,
              ),
              backgroundColor: Color(0xFF97723F),
            );
          }),
    );
  }
}
