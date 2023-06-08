import 'package:get/get.dart';

import '../../buttonnava/controllers/buttonnava_controller.dart';

import '../../login/controllers/login_controller.dart';

import '../../user/gallery/controllers/gallery_controller.dart';
import '../../user/home/controllers/home_controller.dart';
import '../../user/menu/controllers/menu_controller.dart';
import '../controllers/bottomnavu_controller.dart';

class BottomnavuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomnavuController>(
      () => BottomnavuController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<MenuControllers>(
      () => MenuControllers(),
    );
    Get.lazyPut<GalleryController>(
      () => GalleryController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
     Get.lazyPut<ButtonnavaController>(
      () => ButtonnavaController(),
    );
    

  }
}
