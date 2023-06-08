import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/mediumtxt.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/smalltxt.dart';

import '../../../../../widgets/halfmedium.dart';
import '../controllers/addprofil_controller.dart';

class AddprofilView extends GetView<AddprofilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambahkan Data Profl WBJ'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GetBuilder<AddprofilController>(builder: (imc) {
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
                      text: "NAMA",
                      color: Colors.black,
                    ),
                    Smalltext(
                      text: "Masukan nama kedai baru",
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
                      text: "ALAMAT",
                      color: Colors.black,
                    ),
                    Smalltext(
                      text: "Tambahkan alaman kedai ",
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
                  maxLength: 50,
                  controller: controller.alamatC,
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
                      text: "JAM",
                      color: Colors.black,
                    ),
                    Smalltext(
                      text: "Masukan waktu atau jam buka ",
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
                  maxLength: 30,
                  controller: controller.jamC,
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
                      text: "Masukan keterang dan penjelasan kedai",
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
              Obx(
                () => Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child:controller.isLoading.isFalse? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(250, 35), primary: Colors.black),
                      onPressed: () {
                        if(controller.isLoading.isFalse){
                          controller.addProfilWbj();
                        }
                      },
                      child: Halfmedium(
                        text: "TAMBAHKAN",
                        color: Colors.white,
                      ),
                    ):CircularProgressIndicator(color: Colors.black,)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
