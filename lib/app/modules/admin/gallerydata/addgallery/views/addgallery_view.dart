import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../widgets/halfmedium.dart';
import '../../../../../widgets/mediumtxt.dart';
import '../../../../../widgets/smalltxt.dart';
import '../controllers/addgallery_controller.dart';

class AddgalleryView extends GetView<AddgalleryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAMBAHKAN FOTO'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<AddgalleryController>(builder: (imc) {
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
                              width: 500,
                              child: Icon(
                                Icons.image,
                                size: 50.0,
                              )));
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
                                    controller.addGaleriWbj();
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
