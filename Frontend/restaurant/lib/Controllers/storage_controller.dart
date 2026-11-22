import 'package:get/get.dart';
import 'package:restaurant/storage/storage_service.dart';

class StorageController extends GetxController implements GetxService {
  final StorageService storageService;
  StorageController({
    required this.storageService,
  });

  Future<void> saveAppOpenFirstTime(bool value) async {
    await storageService.saveAppOpenFirstTime(value);
  }

  bool getAppOpenFirstTime() {
    return storageService.getAppOpenFirstTime();
  }

  Future<void> saveIsLanguageAlreadySet(bool value) async {
    await storageService.saveIsLanguageAlreadySet(value);
  }

  bool getIsLanguageAlreadySet() {
    return storageService.getIsLanguageAlreadySet();
  }

  // Test Purpose

  void removeAppOpenFirstTime() {
    storageService.removeAppOpenFirstTime();
  }

  void removeIsLanguageAlreadySet() {
    storageService.removeIsLanguageAlreadySet();
  }
}
