import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/dataacara.dart';
import '../../../../data/datamenu.dart';
import '../../../../data/dataprofil.dart';

import '../../../../widgets/bigtxt.dart';
import '../../../../widgets/mediumtxt.dart';
import '../../detailacara/views/detailacara_view.dart';
import '../../detailmenu/views/detailmenu_view.dart';

import 'package:warkopbangjago_aplikasi/app/widgets/halfmedium.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/smalltxt.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Info Kedai
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.streamProfil(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data?.docs.length == 0 ||
                        snapshot.data == null) {
                      return Center(
                        child: Container(
                          height: 100,
                          padding: EdgeInsets.only(top: 20),
                        
                          child: Text("Belum Ada Info ")),
                      );
                    }
                    print(snapshot.data!.docs);
                    ModeldataProfil dataprofil =
                        ModeldataProfil.fromJson(snapshot.data!.docs.single);
                    return Container(
                      child: Column(
                        children: [
                          Container(
                              height: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(dataprofil.imageFile),
                                ),
                              )),
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
                    );
                  }),
              //Acara
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Mediumtxt(
                      text: "APA YANG BARU ?",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Smalltext(
                      text: "Kegiatan dan juga menu baru akan hadir disini",
                      color: Color(0xFF9E9E9E),
                    )
                  ],
                ),
              ),
              //Card Acara
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.streamAcara(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data?.docs.length == 0 ||
                        snapshot.data == null) {
                      return Center(
                        child: Container(
                          height: 100,
                          padding: EdgeInsets.only(top: 20),
                        
                          child: Text("Belum Ada Acara")),
                      );
                    }

                    return Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 250,
                      width: 400,
                      child: PageView.builder(
                          controller: controller.pageController,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            ModeldataAcara dataAcara = ModeldataAcara.fromJson(
                                snapshot.data!.docs[index]);
                            return InkWell(
                              onTap: () => Get.to(DetailacaraView(dataAcara)),
                              child: Container(
                                padding: EdgeInsets.all(4),
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
                                            left: 10.0, right: 10.0, top: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Halfmedium(
                                              text: dataAcara.nama,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Expanded(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Icon(Icons.access_time,
                                                              size: 13,
                                                              color: Color(
                                                                  0xFFC79C60)),
                                                          Expanded(
                                                            child: Smalltext(
                                                                text: dataAcara.jam),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          size: 13,
                                                          color:
                                                              Color(0xFFC79C60),
                                                        ),
                                                        Expanded(
                                                          child: Smalltext(
                                                              text: dataAcara
                                                                  .alamat),
                                                        )
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
                            );
                          }),
                    );
                  }),
              //Rekomendasi
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 15, top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Mediumtxt(text: "REKOMENDASI"),
                    SizedBox(
                      height: 5,
                    ),
                    Smalltext(
                      text: "Makanan dan Minuman untuk mu",
                      color: Color(0xFF9E9E9E),
                    )
                  ],
                ),
              ),
              //Card Rekomendasi
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.menuHomeStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var datasnap = snapshot.data!.docs;

                    if (datasnap.length == 0 || snapshot.data == null) {
                      return Center(
                        child: Container(
                          height: 100,
                          padding: EdgeInsets.only(top: 20),
                        
                          child: Text("Belum Ada Rekomendasi")),
                      );
                    }
                    print(snapshot.data!.docs);
                    return Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 400,
                      child: GridView.builder(
                        itemCount: datasnap.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          ModeldataMennu dataHomeMenu =
                              ModeldataMennu.fromJson(datasnap[index]);

                          return Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: () {
                                Get.to(DetailmenuView(dataHomeMenu));
                              },
                              child: Stack(
                                children: [
                                 
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10)
                                              ),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  dataHomeMenu.imageFile),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(height: 110,),
                                            Expanded(
                                              child: Container(
                                                color: Colors.black.withOpacity(0.7),
                                                padding: EdgeInsets.only(
                                                    top: 10, right: 10, left: 5,bottom: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Halfmedium(
                                                        text: dataHomeMenu.nama,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.monetization_on,
                                                            size: 18,
                                                            color: Color(0xFFC79C60),
                                                          ),
                                                          SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Smalltext(
                                                              text: dataHomeMenu.harga,size: 14,color: Color(0xFFC79C60),)
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Smalltext(
                                                      text: dataHomeMenu.deskripsi,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                   
                                ],
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
