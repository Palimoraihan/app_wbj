import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/data/datamenu.dart';
import '../../../../widgets/bigtxt.dart';
import '../../../../widgets/smalltxt.dart';
import '../controllers/detailmenu_controller.dart';

class DetailmenuView extends GetView<DetailmenuController> {
  ModeldataMennu dataDetailMenu;
  DetailmenuView ( this.dataDetailMenu);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.network(dataDetailMenu.imageFile),
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
                  text: dataDetailMenu.nama
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0, left: 16.0,bottom: 10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: Color(0xFFC79C60),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Smalltext(text: dataDetailMenu.harga,size: 16.0,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataDetailMenu.deskripsi,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
