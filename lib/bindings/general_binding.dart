import 'package:get/get.dart';
import 'package:real_estate/data/repositories/authentication_repositories.dart';
import 'package:real_estate/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// -- Core
    Get.put(NetworkManager());
    Get.lazyPut(() => AuthenticationRepository(), fenix: true);
    // Get.lazyPut(() => SignUpController(), fenix: true);
    // Get.lazyPut(() => UserController(), fenix: true);
    // Get.lazyPut(() => PlayerController(), fenix: true);
    // Get.lazyPut(() => MatchController());
  }
}
