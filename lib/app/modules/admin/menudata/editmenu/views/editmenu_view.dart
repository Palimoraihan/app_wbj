import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/data/datamenu.dart';
import '../../../../../widgets/halfmedium.dart';
import '../../../../../widgets/mediumtxt.dart';
import '../../../../../widgets/smalltxt.dart';
import '../controllers/editmenu_controller.dart';

class EditmenuView extends GetView<EditmenuController> {
  Widget build(BuildContext context) {
    ModeldataMennu dataMenu;
    return Scaffold(
      appBar: AppBar(
        title: Text('PERBARUI DATA MENU'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Map<String, dynamic>?>(
            future: controller.getMenu(Get.arguments.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data == null) {
                return Center(
                  child: Text("Tidak dapat mengambil informasi data menu."),
                );
              } else {
               
                controller.namaC.text = snapshot.data!["Nama"];
                controller.hargaC.text = snapshot.data!["Harga"];
                controller.deskripsiC.text = snapshot.data!["deskripsi"];
                controller.isRekomedasi = snapshot.data!["Rekomendasi"];
                return Container(
                  margin:
                      EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GetBuilder<EditmenuController>(builder: (imc) {
                        return InkWell(
                            onTap: () {
                              imc.pickImage();
                            },
                            child: imc.image != null
                                ? Container(
                                    height: 250,
                                    width: 600,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(File(imc.image!.path)),
                                      ),
                                    ),
                                  )
                                : snapshot.data?['Foto Menu'] != null
                                    ? Container(
                                        height: 250,
                                        width: 600,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                snapshot.data!['Foto Menu']),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 150,
                                        child: Icon(
                                          Icons.image,
                                          size: 50.0,
                                        )));
                      }),
                      SizedBox(height: 20,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Mediumtxt(text: "ID :",color: Colors.black,),
                                SizedBox(width: 10),
                                Smalltext(text:snapshot.data!["Id Menu"],size: 20, color: Colors.black,),
                              ],
                            ),
                            SizedBox(height:15),
                            Mediumtxt(
                              text: "NAMA",
                              color: Colors.black,
                            ),
                            Smalltext(
                              text: "Perbarui nama makan atau minuman terbaru",
                              color: Color.fromARGB(255, 165, 165, 164),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 114, 113, 113)
                                .withOpacity(0.35),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextField(
                          maxLength: 30,
                          controller: controller.namaC,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Mediumtxt(
                              text: "HARGA",
                              color: Colors.black,
                            ),
                            Smalltext(
                              text:
                                  "Perbarui harga makanan dan minuman terbaru ",
                              color: Color.fromARGB(255, 165, 165, 164),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 114, 113, 113)
                                .withOpacity(0.35),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextField(
                          maxLength: 15,
                          controller: controller.hargaC,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Mediumtxt(
                              text: "DESKRIPSI",
                              color: Colors.black,
                            ),
                            Smalltext(
                              text:
                                  "Perbarui keterang dan penjelasan makanan dan minuman terbaru",
                              color: Color.fromARGB(255, 165, 165, 164),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 114, 113, 113)
                                .withOpacity(0.35),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextField(
                          controller: controller.deskripsiC,
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      GetBuilder<EditmenuController>(builder: (c) {
                        return CheckboxListTile(
                            title: Mediumtxt(
                                text: "REKOMENDASI", color: Colors.black),
                            value: c.isRekomedasi,
                            onChanged: (value) {
                              c.rekomend();
                              print(value);
                            });
                      }),
                      Obx(
                        () => Center(
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 30),
                              child: controller.isLoading.isFalse
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: Size(250, 35),
                                          primary: Colors.black),
                                      onPressed: () {
                                        if (controller.isLoading.isFalse) {
                                          controller.editMenuWbj(
                                              Get.arguments.toString());
                                        }
                                      },
                                      child: Halfmedium(
                                        text: "PERBARUI",
                                        color: Colors.white,
                                      ),
                                    )
                                  : CircularProgressIndicator(
                                      color: Colors.black,
                                    )),
                        ),
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
