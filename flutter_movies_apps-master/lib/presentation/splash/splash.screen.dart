import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movies_apps/config.dart';

import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.nextToHome();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:const AssetImage('assets/backgrounds/splash_background.jpg'),
            fit: BoxFit.cover,
            colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken)
          )
        ),
        child: Center(
          child: Image.asset('assets/logos/apps_logo.png'),
        ),
      ),
    );
  }
}
