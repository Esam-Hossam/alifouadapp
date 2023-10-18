import 'package:get/get.dart';

class UserInfoController extends GetxController {
  final userFullname = ''.obs;
  final userEmail = ''.obs;
  final userPhone = ''.obs;
  final userCountryCode = ''.obs;
  updateUserInfo({String fullName = "", String email = "", String phone = "", String countryCode = ""}) {
    userFullname(fullName);
    userEmail(email);
    userPhone(phone);
    userCountryCode(countryCode);
  }
}
