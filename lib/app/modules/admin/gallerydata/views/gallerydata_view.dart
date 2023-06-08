import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/data/datagaleri.dart';
import 'package:warkopbangjago_aplikasi/app/modules/admin/gallerydata/addgallery/views/addgallery_view.dart';
import 'package:warkopbangjago_aplikasi/app/modules/admin/gallerydata/editgallery/views/editgallery_view.dart';
import 'package:warkopbangjago_aplikasi/app/routes/app_pages.dart';

import '../../../../widgets/bigtxt.dart';
import '../../../../widgets/mediumtxt.dart';
import '../../../../widgets/smalltxt.dart';
import '../controllers/gallerydata_controller.dart';

class GallerydataView extends GetView<GallerydataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Bigtext(
          text: "DATA GALERI WBJ",
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
      body: Container(
        padding: EdgeInsets.all(10.0),
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
              itemBuilder: ( context,index) { 
                ModeldataGaleri datagaleri = ModeldataGaleri.fromJson(snapshot.data!.docs[index]);
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(datagaleri.imageFile),
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
                                controller.deleteGaleri(datagaleri );
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
                );
              
               },
             
            );
          }
        ),
      ),
       floatingActionButton: FloatingActionButton(
        heroTag: "fab4",
          onPressed: () {
            Get.toNamed(Routes.ADDGALLERY);
          },
          child: Icon(Icons.add,size: 40.0,),
          backgroundColor: Color(0xFF97723F),
        )
    );
  }
}
