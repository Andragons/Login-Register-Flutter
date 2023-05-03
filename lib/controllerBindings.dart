import 'package:get/instance_manager.dart';
import 'package:coba/controller/authController.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }
}
