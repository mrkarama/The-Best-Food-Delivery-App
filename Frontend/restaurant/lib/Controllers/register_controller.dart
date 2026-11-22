import 'package:get/get.dart';
import 'package:restaurant/Data/Repositories/auth_repo.dart';
import 'package:restaurant/commons/constants/api_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/response_model.dart';
import '../Models/signup_model.dart';

class RegisterController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  final SharedPreferences sharedPreferences;

  RegisterController({
    required this.authRepository,
    required this.sharedPreferences,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(LoginModel loginModel) async {
    _isLoading = true;
    update();
    final Response response = await authRepository.registration(loginModel);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      final String token = response.body['token'];

      print(
          'Shared Prefs saving is ....${sharedPreferences.containsKey(ApiValues.token)}');
      print('User token is...........$token');

      authRepository.saveUserToken(token);

      responseModel = ResponseModel(
        isSuccess: true,
        message: token,
      );
    } else {
      print('Registration failed');
      responseModel = ResponseModel(
        isSuccess: false,
        message: response.statusText!,
      );
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
