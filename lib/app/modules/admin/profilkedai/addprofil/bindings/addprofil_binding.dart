import 'package:get/get.dart';

import '../controllers/addprofil_controller.dart';

class AddprofilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddprofilController>(
      () => AddprofilController(),
    );
  }
}
