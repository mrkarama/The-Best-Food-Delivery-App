import 'package:get/get.dart';
import 'package:restaurant/Data/Repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/response_model.dart';
import '../Models/signin_model.dart';

class LoginController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  final SharedPreferences sharedPreferences;

  LoginController({
    required this.authRepository,
    required this.sharedPreferences,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> login(SigninModel signinModel) async {
    _isLoading = true;
    update();
    final Response response = await authRepository.login(signinModel);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      final String token = response.body['token'];
      authRepository.saveUserToken(token);
      responseModel = ResponseModel(isSuccess: true, message: token);
    } else {
      responseModel =
          ResponseModel(isSuccess: false, message: response.toString());
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  // Test
  void removeToken() {
    authRepository.removeToken();
  }
}
