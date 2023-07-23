import 'package:get_storage/get_storage.dart';

GetStorage getStorage = GetStorage();

String prefeUserName = "";
String prefeEmail = "";
int prefeBoardingStep = 1;

class PreferenceString {
  /// USERNAME
  static String username = "username";
  static Future setUserName({required String value}) async {
    await getStorage.write(username, value);
    prefeUserName = await getStorage.read(username);
  }

  /// STEP
  static String step = "step";
  static Future setStep({required int value}) async {
    await getStorage.write(step, value);
  }

  static Future<int> getStep() async {
    return await getStorage.read(step);
  }

  /// EMAIL
  static String email = "email";
  static Future setEmail({required String value}) async {
    await getStorage.write(email, value);
    prefeEmail = await getStorage.read(email);
  }
}
