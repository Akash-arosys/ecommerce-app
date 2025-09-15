import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:real_estate/features/authentication/screens/login.dart';
import 'package:real_estate/features/authentication/screens/onboarding.dart';

/// -- README(Docs[6]) -- Bindings
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.put(AuthenticationRepository());

  final deviceStorage = GetStorage();
  // final Rx<UserModel> _currentUser = UserModel.empty().obs;

  /// Getters
  // UserModel get user => _currentUser.value;
  // String get getUserID => _currentUser.value.id;
  // String get getUserEmail => _currentUser.value.email;
  // String get getDisplayName => _currentUser.value.fullName;
  // String get getPhoneNo => _currentUser.value.mobile;

  @override
  void onReady() async {
    // final token = deviceStorage.read('token');
    FlutterNativeSplash.remove();
    // if (token != null) {
    // try {
    // await refreshToken();
    // final currentUser = await fetchUserDetails();
    // _currentUser.value = currentUser;
    // await TLocalStorage.init(currentUser.id);
    // screenRedirect(_currentUser.value);
    // } catch (e) {
    // debugPrint('Failed to fetch user: $e');
    screenRedirect();
    // }
    // } else {
    //   screenRedirect(null); // Navigate to login/onboarding
    // }
  }

  /// Handles screen routing logic
  screenRedirect() async {
    // if (user != null && user.id.isNotEmpty) {
    //   Get.offAll(() => const NavigationMenu());
    // } else {
    deviceStorage.writeIfNull('isFirstTime', true);
    final bool isFirstTime = deviceStorage.read('isFirstTime') as bool;

    if (isFirstTime) {
      await Get.offAll(() => const OnBoardingScreen());
      deviceStorage.write('isFirstTime', false);
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }
}
