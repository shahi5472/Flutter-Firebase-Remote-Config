import 'package:flutter_remote_config/remote/fire_remote_config.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final remoteConfig = Get.find<FireRemoteConfig>().remoteConfig;
}
