import 'package:get/get.dart';

import '../../buttonnava/controllers/buttonnava_controller.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );

  }
}
