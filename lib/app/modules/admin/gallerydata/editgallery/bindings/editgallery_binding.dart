import 'package:get/get.dart';

import '../controllers/editgallery_controller.dart';

class EditgalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditgalleryController>(
      () => EditgalleryController(),
    );
  }
}
