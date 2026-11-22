import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:restaurant/Data/Api/api_client.dart';

class HomeRepository extends GetxService {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient});

  Future<Response> getPopularProducts() async {
    return await apiClient.getData(ApiValues.popularUri);
  }

  Future<Response> getRecommendedProducts() async {
    return await apiClient.getData(ApiValues.recommendedUri);
  }

  Future<Response> getPizzaCategoryProducts() async {
    return await apiClient.getData(ApiValues.pizzaUri);
  }

  Future<Response> getDrinksCategoryProducts() async {
    return await apiClient.getData(ApiValues.drinksUri);
  }

  Future<Response> getBiryaniCategoryProducts() async {
    return await apiClient.getData(ApiValues.biryaniUri);
  }

  Future<Response> getThaliCategoryProducts() async {
    return await apiClient.getData(ApiValues.thaliUri);
  }

  Future<Response> getBurgersCategoryProducts() async {
    return await apiClient.getData(ApiValues.burgersUri);
  }

  Future<Response> getChickenCategoryProducts() async {
    return await apiClient.getData(ApiValues.chickenUri);
  }

  Future<Response> getRollsCategoryProducts() async {
    return await apiClient.getData(ApiValues.rollsUri);
  }

  Future<Response> getMomosCategoryProducts() async {
    return await apiClient.getData(ApiValues.momosUri);
  }

  Future<Response> getCakeCategoryProducts() async {
    return await apiClient.getData(ApiValues.cakeUri);
  }

  Future<Response> getNoodlesCategoryProducts() async {
    return await apiClient.getData(ApiValues.noodlesUri);
  }

  Future<Response> getDosaCategoryProducts() async {
    return await apiClient.getData(ApiValues.dosaUri);
  }

  Future<Response> getSandwichCategoryProducts() async {
    return await apiClient.getData(ApiValues.sandwichUri);
  }

  Future<Response> getAllProducts() async {
    return await apiClient.getData(ApiValues.allProductsUri);
  }

  Future<Response> getIdliCategoryProducts() async {
    return await apiClient.getData(ApiValues.idliUri);
  }
}
