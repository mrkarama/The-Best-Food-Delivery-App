import 'package:get/get.dart';
import 'package:restaurant/Data/Api/api_client.dart';
import 'package:restaurant/commons/constants/api_values.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/signin_model.dart';
import '../../Models/signup_model.dart';

class AuthRepository extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepository({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(LoginModel loginModel) async {
    return await apiClient.postData(
      ApiValues.registerUri,
      loginModel.toJson(),
    );
  }

  Future<Response> login(SigninModel signinModel) async {
    return await apiClient.postData(ApiValues.loginUri, signinModel.toJson());
  }

  Future<bool> saveUserToken(String token) async {
    try {
      await sharedPreferences.setString(ApiValues.token, token);
      apiClient.token = token;
      apiClient.updateHeaders(token);
    } catch (e) {
      print('Error occurred while saving the user token');
    }

    return sharedPreferences.containsKey(ApiValues.token);
  }

  Future<void> saveUserEmailAndPassword(SigninModel signinModel) async {
    try {
      await sharedPreferences.setString(ApiValues.email, signinModel.email);
      await sharedPreferences.setString(
          ApiValues.password, signinModel.password);
    } catch (e) {
      print('Error occurred while saving user email and password.');
      print(e.toString());
    }
  }

  Future<Response> getUserInformation() async {
    try {
      Response response = await apiClient.getData(ApiValues.userEntitiesUri);

      return response;
    } catch (e) {
      print('ERROR OCCURED WHILE FECTHING USER INFO');
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  // Later also remove User's email and password from the memory
  Future<bool> onLogout() async {
    sharedPreferences.remove(ApiValues.token);
    apiClient.token = '';
    apiClient.updateHeaders('');

    return true;
  }

  bool isUserLoggedIn() {
    return sharedPreferences.containsKey(ApiValues.token);
  }

  // Test
  Future<void> removeToken() async {
    sharedPreferences.remove(ApiValues.token);
  }
}
