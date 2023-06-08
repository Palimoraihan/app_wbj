import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/data/dataacara.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/bigtxt.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/halfmedium.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/mediumtxt.dart';
import 'package:warkopbangjago_aplikasi/app/widgets/smalltxt.dart';

import '../controllers/detailacara_controller.dart';

class DetailacaraView extends GetView<DetailacaraController> {
  ModeldataAcara dataDetailAcara;
  DetailacaraView (this.dataDetailAcara);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.network(dataDetailAcara.imageFile),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF97723F),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Center(
                child: Bigtext(
                  text: dataDetailAcara.nama,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Color(0xFFC79C60),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Smalltext(
                        text: dataDetailAcara.jam,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFFC79C60),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Smalltext(
                        text: dataDetailAcara.alamat,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                dataDetailAcara.deskripsi,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
