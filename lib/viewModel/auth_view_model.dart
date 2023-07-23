import 'dart:developer';
import 'package:get/get.dart';

import '../model/repo/login_repo.dart';
import '../model/apis/api_response.dart';
import '../model/apiModel/requestModel/login_req_model.dart';

class AuthViewModel extends GetxController {
  ApiResponse loginApiResponse = ApiResponse.initial('INITIAL');

  /// ======================== LOGIN VIEW MODEL ================================

  Future<void> login(LoginReqModel reqModel) async {
    log('loading..');
    loginApiResponse = ApiResponse.loading('LOADING');
    update();
    try {
      final response = await LoginRepo().login(reqModel);
      loginApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('loginApiResponse ERROR :=> $e');
      loginApiResponse = ApiResponse.error('ERROR');
    }
    update();
  }

}
