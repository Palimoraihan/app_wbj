import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/data/dataacara.dart';

import 'package:warkopbangjago_aplikasi/app/modules/admin/acaradata/editacara/views/editacara_view.dart';
import 'package:warkopbangjago_aplikasi/app/routes/app_pages.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/bigtxt.dart';

import '../../../../widgets/halfmedium.dart';
import '../../../../widgets/smalltxt.dart';
import '../controllers/acaradata_controller.dart';

class AcaradataView extends GetView<AcaradataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Bigtext(
            text: "DATA ACARA WBJ",
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
            stream: controller.streamAcara(),
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
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    ModeldataAcara dataAcara =
                        ModeldataAcara.fromJson(snapshot.data!.docs[index]);
                    return Container(
                      margin: EdgeInsets.only(
                          top: 10.0, bottom: 5.0, left: 16.0, right: 16.0),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () => Get.toNamed(Routes.EDITACARA,
                                arguments: dataAcara.id),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                dataAcara.imageFile))),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 15.0,
                                        bottom: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                          
                                            Halfmedium(
                                              text: dataAcara.nama,
                                              color: Colors.black,
                                            ),
                                            Smalltext(text: dataAcara.id),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(Icons.access_time,
                                                        size: 13,
                                                        color:
                                                            Color(0xFFC79C60)),
                                                    Smalltext(
                                                        text: dataAcara.jam)
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      size: 13,
                                                      color: Color(0xFFC79C60),
                                                    ),
                                                    Smalltext(
                                                        text: dataAcara.alamat)
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Smalltext(
                                          text: dataAcara.deskripsi,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 10,),
                              CircleAvatar(
                                child: IconButton(
                                    onPressed: () {
                                      controller.deleteAcara(dataAcara);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    )),
                                backgroundColor: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }),
        floatingActionButton: FloatingActionButton(
          heroTag: "fab2",
          onPressed: () {
            Get.toNamed(Routes.ADDACARA);
          },
          child: Icon(
            Icons.add,
            size: 40.0,
          ),
          backgroundColor: Color(0xFF97723F),
        ));
  }
}
