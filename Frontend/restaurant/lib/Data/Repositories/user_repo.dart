import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:restaurant/Commons/constants/app_values.dart';
import 'package:restaurant/Data/Api/api_client.dart';
import 'package:restaurant/Models/address_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  UserRepository({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<void> saveSharedUserAddress(AddressModel addressModel) async {
    await sharedPreferences.setString(
      AppValues.userAddress,
      jsonEncode(addressModel),
    );
  }

  Future<Response> saveUserAddress(AddressModel addressModel) async {
    return await apiClient.postData(
      ApiValues.userAddress,
      addressModel.toJson(),
    );
  }

  Future<Response> getUserAddress() async {
    return await apiClient.getData(ApiValues.getUserAddress);
  }

  String getAddressData() {
    return sharedPreferences.getString(AppValues.userAddress) ?? '';
  }

  Future<Response> trackOrder() async {
    return await apiClient.getData(ApiValues.trackOrder);
  }

  // Test
  bool isAddressSaved() {
    return sharedPreferences.containsKey(AppValues.userAddress);
  }

  void removeSharedAddressData() {
    sharedPreferences.remove(AppValues.userAddress);
  }
}
