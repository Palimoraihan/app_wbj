import 'package:get/get.dart';


import '../controllers/menudata_controller.dart';


class MenudataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenudataController>(
      () => MenudataController(),
    );
  }
}
