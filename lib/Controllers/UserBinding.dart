import 'package:alifouadapp/Controllers/UserInfoController.dart';
import 'package:get/get.dart';

class UserBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => UserInfoController());
  }
}
