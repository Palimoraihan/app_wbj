import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/data/datamenu.dart';
import 'package:warkopbangjago_aplikasi/app/modules/admin/menudata/addmenu/views/addmenu_view.dart';
import 'package:warkopbangjago_aplikasi/app/routes/app_pages.dart';
import '../../../../widgets/bigtxt.dart';
import '../../../../widgets/halfmedium.dart';
import '../../../../widgets/smalltxt.dart';
import '../controllers/menudata_controller.dart';
import '../editmenu/views/editmenu_view.dart';

class MenudataView extends GetView<MenudataController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Bigtext(
          text: "DATA MENU WBJ",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: controller.streamAddMenu() ,
              builder: (context,snapshot) {
                if (snapshot.connectionState== ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data?.docs.length==0 || snapshot.data == null){
                   return Center(
                    child: Text("Belum Ada Data"),
                  );
                }
                print(snapshot.data!.docs);
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                  ModeldataMennu dataMenu = ModeldataMennu.fromJson(snapshot.data!.docs[index]);
                     return Container(
                    height: 120,
                    width: 500,
                    margin: EdgeInsets.only(right: 10, left: 10, bottom: 10.0),
                    child: Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.EDITMENU,arguments: dataMenu.id);
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(dataMenu.imageFile),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(top: 15, left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Smalltext(text: dataMenu.id),
                                      SizedBox(height: 10,),
                                      Halfmedium(
                                        text: dataMenu.nama,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.monetization_on,
                                              size: 15,
                                              color: Color(0xFF97723F),
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Smalltext(text: dataMenu.harga)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Smalltext(
                                        text:
                                            dataMenu.deskripsi,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            

                              CircleAvatar(
                                backgroundColor: Colors.red,
                                child: IconButton(
                                  onPressed: () {
                                   controller.deleteMenu(dataMenu);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );}
                  
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
         heroTag: "fab3",
          onPressed: () {
            Get.toNamed(Routes.ADDMENU);
          },
          child: Icon(Icons.add,size: 40.0,),
          backgroundColor: Color(0xFF97723F),
        )
    );
  }
}
