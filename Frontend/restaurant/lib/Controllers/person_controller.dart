import 'package:get/get.dart';
import 'package:restaurant/Data/Repositories/auth_repo.dart';
import 'package:restaurant/Models/user_info_model.dart';

class PersonController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  PersonController({
    required this.authRepository,
  });
  UserInfo userInfo = UserInfo(
    id: -1,
    email: 'Your email',
    name: 'Your name',
    orderCount: -1,
    phone: 'Your phone number',
  );

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool isUserLogged() {
    return authRepository.isUserLoggedIn();
  }

  Future<void> getUserInformation() async {
    Response response = await authRepository.getUserInformation();
    _isLoading = true;
    update();

    if (response.statusCode == 200) {
      userInfo = UserInfo.fromJson(response.body);
    } else {
      print('ERROR GETTING USER INFORMATION');
    }
    _isLoading = false;
    update();
  }

  // Later also remove User's email and password
  Future<void> onLogout() async {
    if (await authRepository.onLogout()) {
      _isLoading = true;
      update();

      await Future.delayed(
        const Duration(seconds: 2),
      );

      _isLoading = false;
      update();
      isUserLogged();
    }
  }
}
