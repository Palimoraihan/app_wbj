import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/halfmedium.dart';
import '../../../../../widgets/mediumtxt.dart';
import '../../../../../widgets/smalltxt.dart';
import '../controllers/addmenu_controller.dart';

class AddmenuView extends GetView<AddmenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAMBAHKAN DATA MENU'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0, top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<AddmenuController>(builder: (imc) {
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
                        : Container(
                            height: 150,
                            width: 600,
                            child: Icon(
                              Icons.image,
                              size: 50.0,
                            )));
              }),
               Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Mediumtxt(
                      text: "ID",
                      color: Colors.black,
                    ),
                    Smalltext(
                      text: "Masukan Id nama makan atau minuman contoh : M_1",
                      color: Color.fromARGB(255, 165, 165, 164),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5,),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 114, 113, 113).withOpacity(0.35),
                    borderRadius: BorderRadius.circular(25)),
                child: TextField(
                  
                  controller: controller.id,
                  maxLength: 5,
                  decoration: InputDecoration(
                    hintText: "M_1",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Mediumtxt(
                      text: "NAMA",
                      color: Colors.black,
                    ),
                    Smalltext(
                      text: "Masukan nama makan atau minuman",
                      color: Color.fromARGB(255, 165, 165, 164),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 114, 113, 113).withOpacity(0.35),
                    borderRadius: BorderRadius.circular(25)),
                child: TextField(
                  controller: controller.namaC,
                  maxLength: 30,
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
                      text: "Tambahkan harga makanan dan minuman ",
                      color: Color.fromARGB(255, 165, 165, 164),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 114, 113, 113).withOpacity(0.35),
                    borderRadius: BorderRadius.circular(25)),
                child: TextField(
                  maxLength: 15,
                  controller: controller.hargaC,
                  decoration: InputDecoration(
                    hintText: "Rp 5.000",
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
                          "Masukan keterang dan penjelasan makanan dan minuman",
                      color: Color.fromARGB(255, 165, 165, 164),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 114, 113, 113).withOpacity(0.35),
                    borderRadius: BorderRadius.circular(25)),
                child: TextField(
                  controller: controller.deskripsiC,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              GetBuilder<AddmenuController>(builder: (c) {
                return CheckboxListTile(
                    title: Mediumtxt(text: "REKOMENDASI", color: Colors.black),
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
                                  controller.addMenuWbj();
                                }
                              },
                              child: Halfmedium(
                                text: "TAMBAHKAN",
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
        ),
      ),
    );
  }
}
