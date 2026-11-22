import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/app_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchRepository extends GetxService {
  final SharedPreferences sharedPreferences;
  SearchRepository({
    required this.sharedPreferences,
  });
  Future<void> saveToPreviousSearchData(List<String> value) async {
    await sharedPreferences.setStringList(AppValues.search, value);
  }

  List<String> getSharedSearchData() {
    return sharedPreferences.getStringList(AppValues.search) ?? [];
  }

  void clearSharedSearchData() {
    sharedPreferences.remove(AppValues.search);
  }
}
