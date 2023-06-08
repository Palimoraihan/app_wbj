import 'package:get/get.dart';

import '../controllers/detailacara_controller.dart';

class DetailacaraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailacaraController>(
      () => DetailacaraController(),
    );
  }
}
