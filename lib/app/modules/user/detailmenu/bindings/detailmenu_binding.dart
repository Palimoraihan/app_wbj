import 'package:get/get.dart';

import '../controllers/detailmenu_controller.dart';

class DetailmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailmenuController>(
      () => DetailmenuController(),
    );
  }
}
