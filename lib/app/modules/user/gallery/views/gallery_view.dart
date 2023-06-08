import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../data/datagaleri.dart';
import '../../../../widgets/bigtxt.dart';
import '../../../../widgets/mediumtxt.dart';
import '../../../../widgets/smalltxt.dart';
import '../controllers/gallery_controller.dart';

class GalleryView extends GetView<GalleryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Mediumtxt(
                      text: "ALBUM KAMI",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Smalltext(
                      text: "Foto-foto dan susana tempa ada disini ",
                      color: Color(0xFF9E9E9E),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: controller.streamAddGaleri(),
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
                      return GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                          ),
                          itemBuilder: (context,index) {
                            ModeldataGaleri datagaleri = ModeldataGaleri.fromJson(snapshot.data!.docs[index]);
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(datagaleri.imageFile),
                                ),
                              ),
                            );
                          });
                    }
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
