import 'package:get/get.dart';

import '../controllers/profilkedai_controller.dart';

class ProfilkedaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilkedaiController>(
      () => ProfilkedaiController(),
    );
  }
}
