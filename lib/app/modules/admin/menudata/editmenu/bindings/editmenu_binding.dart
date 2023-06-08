import 'package:get/get.dart';
import 'package:warkopbangjago_aplikasi/app/modules/admin/menudata/editmenu/controllers/editmenu_controller.dart';

class EditmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditmenuController>(
      () => EditmenuController(),
    );
  }
}
