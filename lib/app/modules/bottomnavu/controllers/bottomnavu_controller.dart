import 'package:get/get.dart';

class BottomnavuController extends GetxController {
  var idxtab = 0;
  void selectNav(int index){
    idxtab = index;
    update();
  }
}
