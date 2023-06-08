import 'package:get/get.dart';

import '../controllers/gallerydata_controller.dart';

class GallerydataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GallerydataController>(
      () => GallerydataController(),
    );
  }
}
