import 'package:get/get.dart';
import '../../admin/acaradata/controllers/acaradata_controller.dart';
import '../../admin/gallerydata/controllers/gallerydata_controller.dart';
import '../../admin/menudata/controllers/menudata_controller.dart';
import '../../admin/profilkedai/controllers/profilkedai_controller.dart';
import '../../bottomnavu/controllers/bottomnavu_controller.dart';
import '../controllers/buttonnava_controller.dart';

class ButtonnavaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ButtonnavaController>(
      () => ButtonnavaController(),
    );
    Get.lazyPut<ProfilkedaiController>(
      () => ProfilkedaiController(),
    );
    Get.lazyPut<AcaradataController>(
      () => AcaradataController(),
    );

    Get.lazyPut<MenudataController>(
      () => MenudataController(),
    );
    
    Get.lazyPut<GallerydataController>(
      () => GallerydataController(),
    );

    Get.lazyPut<BottomnavuController>(
      () => BottomnavuController(),
    );
  }
}
