import 'package:atakholdingapp/auth/login_request_model.dart';
import 'package:atakholdingapp/auth/login_response_model.dart';
import 'package:atakholdingapp/endpoints.dart';
import 'package:atakholdingapp/models/base_response_model.dart';
import 'package:atakholdingapp/models/user_model.dart';
import 'package:atakholdingapp/utility/network_adaptor.dart';
import 'package:atakholdingapp/utility/singleton.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GetStorage storage = getIt.get<GetStorage>();
  //login get set
  final Rx<LoginRequestModel> _loginModel = LoginRequestModel().obs;
  LoginRequestModel get loginModel => _loginModel.value;

  void setLoginModel(LoginRequestModel loginModel) {
    _loginModel.value = loginModel;
  }

  //token get set
  final Rx<String> _token = "".obs;
  String get token => _token.value;
  void setToken(String token) {
    _token.value = token;
    if (token != "") {
      storage.write("token", token);
    }
  }

  //user get set
  final _user = UserModel().obs;
  UserModel get user => _user.value;
  void setUser(UserModel b) {
    _user.value = b;
    storage.write("user", b.toJson().toString());
  }

  //send request login
  Future<bool> login() async {
    var data = loginModel.toMap();
    BaseResponseModel response =
        await NetworkAdaptor.post(Endpoints.login, data);
    if (response.success == true) {
      var responsemodel = LoginResponseModel.fromMap(response.data);
      setToken(responsemodel.token ?? "");
      if (responsemodel.user != null) {
        setUser(responsemodel.user!);
      }
      return true;
    }
    return false;
  }

  //send request for logout
  Future<bool> logout() async {
    var data = loginModel.toMap();
    BaseResponseModel response =
        await NetworkAdaptor.post(Endpoints.login, data);
    if (response.success == true) {
      var responsemodel = LoginResponseModel.fromMap(response.data);
      setToken(responsemodel.token ?? "");
      if (responsemodel.user != null) {
        setUser(responsemodel.user!);
      }
      return true;
    }
    return false;
  }
}
