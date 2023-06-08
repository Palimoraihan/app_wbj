import 'package:get/get.dart';

class ButtonnavaController extends GetxController {
  var idxtaba = 0;
  void selectNava(int index){
    idxtaba = index;
    update();
  }
}
