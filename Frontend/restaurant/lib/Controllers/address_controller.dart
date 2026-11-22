import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/Controllers/person_controller.dart';
import 'package:restaurant/Data/Repositories/location_repo.dart';
import 'package:restaurant/Data/Repositories/user_repo.dart';
import 'package:restaurant/Models/address_model.dart';
import 'package:restaurant/Models/response_model.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepository locationRepository;
  final UserRepository userRepository;
  LocationController({
    required this.locationRepository,
    required this.userRepository,
  });

  @override
  void onInit() {
    super.onInit();
    if (Get.find<PersonController>().isUserLogged()) {
      getAddressDataFromDatabase();
    }
  }

  late Position position;
  late Position pickPosition;

  late Map<String, dynamic> getAddress;
  late GoogleMapController googleMapController;

  Placemark placemark = Placemark();
  Placemark pickPlacemark = Placemark();

  List<String> addressTypeList = ['home', 'office', 'others'];

  CameraPosition cameraPosition = const CameraPosition(
      target: LatLng(
        12.3714,
        -1.5197,
      ),
      zoom: 17);

  LatLng initialPoition = const LatLng(
    12.3714,
    -1.5197,
  );

  bool _isLoading = false;
  List<AddressModel> _addressList = <AddressModel>[];
  List<AddressModel> _allAddressList = <AddressModel>[];
  int _addressTypeIndex = 0;
  bool _updateAddress = true;
  bool _changeAddress = true;

  List<AddressModel> get addressList => _addressList;
  List<AddressModel> get allAddressList => _allAddressList;
  int get addressTypeIndex => _addressTypeIndex;
  bool get updateAddress => _updateAddress;
  bool get changeAddress => _changeAddress;
  bool get isLoading => _isLoading;

  void setMapController(GoogleMapController mapController) {
    googleMapController = mapController;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }

  void setAddressList(List<AddressModel> value) {
    _addressList = value;
  }

  Future<void> updatePosition(
      CameraPosition cameraPosition, bool fromAddressPage) async {
    if (_updateAddress) {
      _isLoading = true;
      update();

      try {
        if (fromAddressPage) {
          position = Position(
            longitude: cameraPosition.target.longitude,
            latitude: cameraPosition.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            altitudeAccuracy: 1,
            heading: 1,
            headingAccuracy: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        } else {
          pickPosition = Position(
            longitude: cameraPosition.target.longitude,
            latitude: cameraPosition.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            altitudeAccuracy: 1,
            heading: 1,
            headingAccuracy: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        }

        if (_changeAddress) {
          String address = await getAddressFromGeocode(
            LatLng(
              cameraPosition.target.latitude,
              cameraPosition.target.longitude,
            ),
          );

          fromAddressPage
              ? placemark = Placemark(
                  name: address,
                )
              : pickPlacemark = Placemark(
                  name: address,
                );
        }
      } catch (e) {
        print('ERROR WHILST UPDATING THE POSITION AND ERROR IS $e');
      }
    }
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async {
    String address = 'Unknown location';
    Response response = await locationRepository.getAddressFromGeocode(latLng);

    if (response.statusCode == 200) {
      address = response.body['results'][0]['formatted_address'].toString();
    } else {
      print('ERROR GETTING THE GOOGLE API & STATUS CODE IS ' +
          response.statusCode.toString());
    }

    return address;
  }

  Future<void> saveSharedUserAddress(AddressModel addressModel) async {
    await userRepository.saveSharedUserAddress(addressModel);
  }

  bool isUserAddressSaved() {
    return userRepository.isAddressSaved();
  }

  Future<ResponseModel> saveUserAddress(AddressModel addressModel) async {
    Response response = await userRepository.saveUserAddress(addressModel);

    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _addressList = [];
      _userAddressFromBD = addressModel.address;
      saveSharedUserAddress(addressModel);
      _addressList.add(addressModel);
      responseModel = ResponseModel(
        isSuccess: true,
        message: response.body["message"],
      );
    } else {
      responseModel = ResponseModel(
        isSuccess: false,
        message: "Failed to saved the address.",
      );
      _userAddressFromBD = '';
    }
    update();
    return responseModel;
  }

  AddressModel getAddressData() {
    final String data = userRepository.getAddressData();

    return AddressModel.fromJson(
      jsonDecode(data),
    );
  }

  String _userAddressFromBD = '';
  String get userAddressFromBD => _userAddressFromBD;

  set setUserAddressFromBD(String value) {
    _userAddressFromBD = value;
    update();
  }

  Future<void> getAddressDataFromDatabase() async {
    final Response response = await userRepository.getUserAddress();

    if (response.statusCode == 200) {
      _userAddressFromBD = response.body["address"]["address"];
    } else {
      _userAddressFromBD = '';
    }
    update();
  }

  // test
  void removeSharedAddressData() {
    userRepository.removeSharedAddressData();
  }
}
