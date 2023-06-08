import 'package:get/get.dart';

import '../controllers/addacara_controller.dart';

class AddacaraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddacaraController>(
      () => AddacaraController(),
    );
  }
}
