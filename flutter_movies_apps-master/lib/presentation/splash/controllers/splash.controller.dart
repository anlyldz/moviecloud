
import 'package:get/get.dart';
import 'package:movies_apps/infrastructure/navigation/routes.dart';

class SplashController extends GetxController {

  final count = 0.obs;



  void increment() => count.value++;
  void nextToHome()=>Future.delayed(const Duration(seconds: 5),()async=>await Get.offNamed(Routes.HOME));
}
