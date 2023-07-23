import '../../utils/enum_utils.dart';
import '../apiService/api_service.dart';
import '../apiService/base_service.dart';
import '../apiModel/requestModel/login_req_model.dart';
import '../apiModel/responseModel/login_res_model.dart';

class LoginRepo extends BaseService {
  Future<LoginResModel> login(LoginReqModel reqModel) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      body: reqModel.toJson(),
      url: baseURL + loginURL,
    );
    return LoginResModel.fromJson(response);
  }
}
