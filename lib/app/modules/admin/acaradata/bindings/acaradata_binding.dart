import 'package:get/get.dart';

import '../controllers/acaradata_controller.dart';

class AcaradataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcaradataController>(
      () => AcaradataController(),
    );
  }
}
