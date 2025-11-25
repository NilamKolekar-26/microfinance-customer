import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          width: double.infinity,
          height: double.infinity,
          'asset/logo/whiteImg.jpg', // Ensure this path is correct
          fit: BoxFit.fitWidth, // Fills the screen, cropping if necessary
        ),
      ),
    );
  }
}
