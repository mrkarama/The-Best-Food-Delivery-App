import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/Data/Api/api_client.dart';
import 'package:restaurant/commons/constants/api_values.dart';

class LocationRepository extends GetxService {
  final ApiClient apiClient;
  LocationRepository({
    required this.apiClient,
  });

  Future<Response> getAddressFromGeocode(LatLng latLng) async {
    try {
      Response response = await apiClient.getData(
        '${ApiValues.geocodeURI}?lat=${latLng.latitude}&lng=${latLng.longitude}',
      );

      return response;
    } catch (e) {
      print('ERROR OF $e');
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
