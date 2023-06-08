import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/datamenu.dart';

import '../../../../widgets/bigtxt.dart';
import '../../../../widgets/halfmedium.dart';
import '../../../../widgets/mediumtxt.dart';
import '../../../../widgets/smalltxt.dart';
import '../../detailmenu/views/detailmenu_view.dart';
import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuControllers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, bottom: 15, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Mediumtxt(
                    text: "SEMUA MENU",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Smalltext(
                    text: "Semua dafta menu makanan dan minuman ada di sini",
                    color: Color(0xFF9E9E9E),
                  )
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.streamMenu(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data?.docs.length == 0 ||
                      snapshot.data == null) {
                    return Center(
                      child: Text("Belum Ada Data"),
                    );
                  }
                  print(snapshot.data!.docs);
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          ModeldataMennu dataMenu = ModeldataMennu.fromJson(
                              snapshot.data!.docs[index]);
                          return InkWell(
                            onTap: () {
                              Get.to(DetailmenuView(dataMenu));
                            },
                            child: Container(
                              height: 210,
                              padding: EdgeInsets.all(4),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 5,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              NetworkImage(dataMenu.imageFile),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 110,
                                        ),
                                        Expanded(
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            padding: EdgeInsets.only(
                                                top: 5,
                                                right: 10,
                                                left: 20,
                                                bottom: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Halfmedium(
                                                    text: dataMenu.nama,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: 20,
                                               
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.monetization_on,
                                                        size: 18,
                                                        color:
                                                            Color(0xFFC79C60),
                                                      ),
                                                      SizedBox(
                                                        width: 5.0,
                                                      ),
                                                       Smalltext(
                                                            text: dataMenu.harga,size: 14,color: Color(0xFFC79C60),)
                                                  
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Smalltext(
                                                  text: dataMenu.deskripsi,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
