import 'package:newGetxCLI/utils/AppPreferences/app_areferences.dart';
import 'package:newGetxCLI/utils/services/permission_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // Future.delayed(Duration(seconds: Constants.splashDelay), () {
    //   getScreen();
    // });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getScreen() async {
    String token = await AppPreferences.getToken() ?? "";
    // ignore: unnecessary_null_comparison
    if (token != "" && token != null) {
      //await auth.loadUser();
      await permissionService.loadPermissions();
      // Get.offAndToNamed(Routes.dashboardScreen);
    } else {
      // Get.offAndToNamed(Routes.loginScreen);
    }
  }
}
