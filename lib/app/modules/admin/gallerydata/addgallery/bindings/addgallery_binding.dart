import 'package:get/get.dart';

import '../controllers/addgallery_controller.dart';

class AddgalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddgalleryController>(
      () => AddgalleryController(),
    );
  }
}
