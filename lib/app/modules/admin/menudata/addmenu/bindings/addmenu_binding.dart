import 'package:get/get.dart';

import '../controllers/addmenu_controller.dart';

class AddmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddmenuController>(
      () => AddmenuController(),
    );
  }
}
