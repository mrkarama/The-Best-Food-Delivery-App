import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant/Data/Repositories/blinkit_home_repo.dart';
import 'package:restaurant/Data/Repositories/search_repo.dart';
import 'package:restaurant/Models/products_model.dart';

class ProductsSearchController extends GetxController implements GetxService {
  final HomeRepository homeRepository;
  final SearchRepository searchRepository;
  ProductsSearchController({
    required this.homeRepository,
    required this.searchRepository,
  });
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ProductsModel> _allProductsData = [];
  List<ProductsModel> get allProductsData => _allProductsData;

  List<ProductsModel> _resultSearchData = [];
  List<ProductsModel> get resultSearchData => _resultSearchData;

  Map<int, ProductsModel> _previousSearchDataMap = {};
  Map<int, ProductsModel> get previousSearchDataMap => _previousSearchDataMap;

  List<ProductsModel> _previousSearchData = [];
  List<ProductsModel> get previousSearchData => _previousSearchData;

  set setResultSearchData(List<ProductsModel> list) {
    _resultSearchData = list;
  }

  Future<void> getAllProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getAllProducts();

    if (response.statusCode == 200) {
      final results = response.body['products'] as List<dynamic>;
      _allProductsData = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  void runSearchFilters({
    required String searchText,
  }) {
    if (searchText.isEmpty) {
      _resultSearchData = [];
    } else {
      _resultSearchData = allProductsData
          .where(
            (element) => element.title.toLowerCase().contains(
                  searchText.toLowerCase(),
                ),
          )
          .toList();
    }
    update();
  }

  void addToPreviousSearchData(ProductsModel product) {
    List<String> search = [];
    if (!_previousSearchDataMap.containsKey(product.id)) {
      _previousSearchDataMap.putIfAbsent(product.id, () => product);
    }
    _previousSearchDataMap.forEach((key, value) {
      search.add(jsonEncode(value));
    });
    searchRepository.saveToPreviousSearchData(search);
    update();
  }

  void getPreviousSearchData() {
    _previousSearchData = [];
    for (int i = 0; i < searchRepository.getSharedSearchData().length; i++) {
      _previousSearchData.add(
        ProductsModel.fromJson(
          jsonDecode(
            searchRepository.getSharedSearchData()[i],
          ),
        ),
      );
    }
  }

  void clearSharedSearchData() {
    searchRepository.clearSharedSearchData();
    _previousSearchData = [];
    _previousSearchDataMap = {};
    update();
  }
}
