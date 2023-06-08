import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/editgallery_controller.dart';

class EditgalleryView extends GetView<EditgalleryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditgalleryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditgalleryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
