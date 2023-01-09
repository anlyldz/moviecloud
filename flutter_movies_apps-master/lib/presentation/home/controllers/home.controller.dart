import 'package:get/get.dart';

class HomeController extends GetxController {

  final menuIndex = 0.obs;




  void setMenuIndex(index) => menuIndex.value=index;
}
