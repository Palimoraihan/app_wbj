import 'package:get/get.dart';

import '../data/datamenu.dart';
import '../modules/admin/acaradata/addacara/bindings/addacara_binding.dart';
import '../modules/admin/acaradata/addacara/views/addacara_view.dart';
import '../modules/admin/acaradata/bindings/acaradata_binding.dart';
import '../modules/admin/acaradata/editacara/bindings/editacara_binding.dart';
import '../modules/admin/acaradata/editacara/views/editacara_view.dart';
import '../modules/admin/acaradata/views/acaradata_view.dart';
import '../modules/admin/gallerydata/addgallery/bindings/addgallery_binding.dart';
import '../modules/admin/gallerydata/addgallery/views/addgallery_view.dart';
import '../modules/admin/gallerydata/bindings/gallerydata_binding.dart';
import '../modules/admin/gallerydata/editgallery/bindings/editgallery_binding.dart';
import '../modules/admin/gallerydata/editgallery/views/editgallery_view.dart';
import '../modules/admin/gallerydata/views/gallerydata_view.dart';
import '../modules/admin/menudata/addmenu/bindings/addmenu_binding.dart';
import '../modules/admin/menudata/addmenu/views/addmenu_view.dart';
import '../modules/admin/menudata/bindings/menudata_binding.dart';
import '../modules/admin/menudata/editmenu/bindings/editmenu_binding.dart';
import '../modules/admin/menudata/editmenu/views/editmenu_view.dart';
import '../modules/admin/menudata/views/menudata_view.dart';
import '../modules/admin/profilkedai/addprofil/bindings/addprofil_binding.dart';
import '../modules/admin/profilkedai/addprofil/views/addprofil_view.dart';
import '../modules/admin/profilkedai/bindings/profilkedai_binding.dart';
import '../modules/admin/profilkedai/editprofil/bindings/editprofil_binding.dart';
import '../modules/admin/profilkedai/editprofil/views/editprofil_view.dart';
import '../modules/admin/profilkedai/views/profilkedai_view.dart';
import '../modules/bottomnavu/bindings/bottomnavu_binding.dart';
import '../modules/bottomnavu/views/bottomnavu_view.dart';
import '../modules/buttonnava/bindings/buttonnava_binding.dart';
import '../modules/buttonnava/views/buttonnava_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/screen_splash/bindings/screen_splash_binding.dart';
import '../modules/screen_splash/views/screen_splash_view.dart';
import '../modules/user/detailacara/bindings/detailacara_binding.dart';
import '../modules/user/detailacara/views/detailacara_view.dart';
import '../modules/user/detailmenu/bindings/detailmenu_binding.dart';
import '../modules/user/detailmenu/views/detailmenu_view.dart';
import '../modules/user/gallery/bindings/gallery_binding.dart';
import '../modules/user/gallery/views/gallery_view.dart';
import '../modules/user/home/bindings/home_binding.dart';
import '../modules/user/home/views/home_view.dart';
import '../modules/user/menu/bindings/menu_binding.dart';
import '../modules/user/menu/views/menu_view.dart';

part 'app_routes.dart';

class AppPages {

  AppPages._();

  static const INITIAL = Routes.SCREEN_SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.GALLERY,
      page: () => GalleryView(),
      binding: GalleryBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMNAVU,
      page: () => BottomnavuView(),
      binding: BottomnavuBinding(),
    ),
    GetPage(
      name: _Paths.PROFILKEDAI,
      page: () => ProfilkedaiView(),
      binding: ProfilkedaiBinding(),
    ),
    GetPage(
      name: _Paths.MENUDATA,
      page: () => MenudataView(),
      binding: MenudataBinding(),
    ),
    GetPage(
      name: _Paths.GALLERYDATA,
      page: () => GallerydataView(),
      binding: GallerydataBinding(),
    ),
    GetPage(
      name: _Paths.ACARADATA,
      page: () => AcaradataView(),
      binding: AcaradataBinding(),
    ),
    GetPage(
      name: _Paths.BUTTONNAVA,
      page: () => ButtonnavaView(),
      binding: ButtonnavaBinding(),
    ),
    GetPage(
      name: _Paths.ADDPROFIL,
      page: () => AddprofilView(),
      binding: AddprofilBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFIL,
      page: () => EditprofilView(),
      binding: EditprofilBinding(),
    ),
    GetPage(
      name: _Paths.ADDACARA,
      page: () => AddacaraView(),
      binding: AddacaraBinding(),
    ),
    GetPage(
      name: _Paths.EDITACARA,
      page: () => EditacaraView(),
      binding: EditacaraBinding(),
    ),
    GetPage(
      name: _Paths.ADDMENU,
      page: () => AddmenuView(),
      binding: AddmenuBinding(),
    ),
    GetPage(
      name: _Paths.EDITMENU,
      page: () => EditmenuView(),
      binding: EditmenuBinding(),
    ),
    GetPage(
      name: _Paths.ADDGALLERY,
      page: () => AddgalleryView(),
      binding: AddgalleryBinding(),
    ),
    GetPage(
      name: _Paths.EDITGALLERY,
      page: () => EditgalleryView(),
      binding: EditgalleryBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_SPLASH,
      page: () => ScreenSplashView(),
      binding: ScreenSplashBinding(),
    ),
  ];
}
