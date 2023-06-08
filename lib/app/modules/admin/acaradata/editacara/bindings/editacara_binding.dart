import 'package:get/get.dart';

import '../controllers/editacara_controller.dart';

class EditacaraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditacaraController>(
      () => EditacaraController(),
    );
  }
}
