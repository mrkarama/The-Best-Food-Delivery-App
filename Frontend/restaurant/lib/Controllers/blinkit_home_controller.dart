import 'package:get/get.dart';
import 'package:restaurant/Data/Repositories/blinkit_home_repo.dart';
import 'package:restaurant/Models/products_model.dart';

class BlinkitHomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;

  BlinkitHomeController({
    required this.homeRepository,
  });

  //1
  List<ProductsModel> _pizzaCategoryProducts = [];
  List<ProductsModel> get pizzaCategoryProducts => _pizzaCategoryProducts;

  List<ProductsModel> _drinksCategoryProducts = [];
  List<ProductsModel> get drinksCategoryProducts => _drinksCategoryProducts;

  List<ProductsModel> _biryaniCategoryProducts = [];
  List<ProductsModel> get biryaniCategoryProducts => _biryaniCategoryProducts;

  //2
  List<ProductsModel> _rollsCategoryProducts = [];
  List<ProductsModel> get rollsCategoryProducts => _rollsCategoryProducts;

  List<ProductsModel> _chickenCategoryProducts = [];
  List<ProductsModel> get chickenCategoryProducts => _chickenCategoryProducts;

  List<ProductsModel> _thaliCategoryProducts = [];
  List<ProductsModel> get thaliCategoryProducts => _thaliCategoryProducts;

  List<ProductsModel> _burgersCategoryProducts = [];
  List<ProductsModel> get burgersCategoryProducts => _burgersCategoryProducts;

  List<ProductsModel> _dosaCategoryProducts = [];
  List<ProductsModel> get dosaCategoryProducts => _dosaCategoryProducts;

  List<ProductsModel> _sandwichCategoryProducts = [];
  List<ProductsModel> get sandwichCategoryProducts => _sandwichCategoryProducts;

  //3
  List<ProductsModel> _momosCategoryProducts = [];
  List<ProductsModel> get momosCategoryProducts => _momosCategoryProducts;

  List<ProductsModel> _cakeCategoryProducts = [];
  List<ProductsModel> get cakeCategoryProducts => _cakeCategoryProducts;

  List<ProductsModel> _noodlesCategoryProducts = [];
  List<ProductsModel> get noodlesCategoryProducts => _noodlesCategoryProducts;

  List<ProductsModel> _idliCategoryProducts = [];
  List<ProductsModel> get idliCategoryProducts => _idliCategoryProducts;

  // Categories
  List<List<ProductsModel>> _allCategoryProducts = [];
  List<List<ProductsModel>> get allCategoryProducts => _allCategoryProducts;

  List<List<ProductsModel>> _shopNowCategoryProducts = [];
  List<List<ProductsModel>> get shopNowCategoryProducts =>
      _shopNowCategoryProducts;

  List<List<ProductsModel>> _shopByCategoryProducts = [];
  List<List<ProductsModel>> get shopByCategoryProducts =>
      _shopByCategoryProducts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _radioValue = "default";
  String get radioValue => _radioValue;

  int _listViewIndex = 0;
  int get listViewIndex => _listViewIndex;

  set setListViewIndex(int index) {
    _listViewIndex = index;
  }

  set setRadioValue(String value) {
    _radioValue = value;
    update();
  }

  Future<void> getPizzaCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getPizzaCategoryProducts();

    if (response.statusCode == 200) {
      _pizzaCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _pizzaCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();
      _allCategoryProducts.add(_pizzaCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getBiryaniCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getBiryaniCategoryProducts();

    if (response.statusCode == 200) {
      _biryaniCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _biryaniCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();
      _allCategoryProducts.add(_biryaniCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getDrinksCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getDrinksCategoryProducts();

    if (response.statusCode == 200) {
      _drinksCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _drinksCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _allCategoryProducts.add(_drinksCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getBurgersCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getBurgersCategoryProducts();

    if (response.statusCode == 200) {
      _burgersCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _burgersCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _shopByCategoryProducts.add(_burgersCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getChickenCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getChickenCategoryProducts();

    if (response.statusCode == 200) {
      _chickenCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _chickenCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _shopByCategoryProducts.add(_chickenCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getRollsCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getRollsCategoryProducts();

    if (response.statusCode == 200) {
      _rollsCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _rollsCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _shopByCategoryProducts.add(_rollsCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getIdliCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getIdliCategoryProducts();

    if (response.statusCode == 200) {
      _idliCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _idliCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _shopByCategoryProducts.add(_idliCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getThaliCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getThaliCategoryProducts();

    if (response.statusCode == 200) {
      _thaliCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _thaliCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _shopByCategoryProducts.add(_thaliCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getMomosCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getMomosCategoryProducts();

    if (response.statusCode == 200) {
      _momosCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _momosCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _shopNowCategoryProducts.add(_momosCategoryProducts);
      _shopByCategoryProducts.add(_momosCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getCakeCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getCakeCategoryProducts();

    if (response.statusCode == 200) {
      _cakeCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _cakeCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _shopNowCategoryProducts.add(_cakeCategoryProducts);
      _shopByCategoryProducts.add(_cakeCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getNoodlesCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getNoodlesCategoryProducts();

    if (response.statusCode == 200) {
      _noodlesCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _noodlesCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _shopNowCategoryProducts.add(_noodlesCategoryProducts);
      _shopByCategoryProducts.add(_noodlesCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getDosaCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getDosaCategoryProducts();

    if (response.statusCode == 200) {
      _dosaCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _dosaCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _shopByCategoryProducts.add(_dosaCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  Future<void> getSandwichCategoryProducts() async {
    _isLoading = true;
    update();
    final Response response =
        await homeRepository.getSandwichCategoryProducts();

    if (response.statusCode == 200) {
      _sandwichCategoryProducts = [];
      final results = response.body['products'] as List<dynamic>;
      _sandwichCategoryProducts = results
          .map((e) => ProductsModel.fromJson(e))
          .toList()
          .reversed
          .toList();

      _shopByCategoryProducts.add(_sandwichCategoryProducts);
    } else {
      print('Error occurred !');
    }
    _isLoading = false;
    update();
  }

  bool _isLoadingShimmer = false;
  bool get isLoadingShimmer => _isLoadingShimmer;

  bool _isSingleItemLoading = false;
  bool get isSingleItemLoading => _isSingleItemLoading;

  Future<void> onLoadingShimmer() async {
    _isLoadingShimmer = true;
    update();
    await Future.delayed(
      const Duration(seconds: 2),
    );
    _isLoadingShimmer = false;
    update();
  }

  Future<void> onSingleItemLoading() async {
    _isSingleItemLoading = true;
    update();
    await Future.delayed(
      const Duration(milliseconds: 800),
    );
    _isSingleItemLoading = false;
    update();
  }

  List<ProductsModel> _popularProducts = [];
  List<ProductsModel> _recommendedrProducts = [];

  List<ProductsModel> get popularProducts => _popularProducts;
  List<ProductsModel> get recommendedProducts => _recommendedrProducts;

  Future<void> getPopularProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getPopularProducts();

    if (response.statusCode == 200) {
      final results = response.body['products'] as List<dynamic>;
      _popularProducts = results
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

  Future<void> getRecommendedProducts() async {
    _isLoading = true;
    update();
    final Response response = await homeRepository.getRecommendedProducts();

    if (response.statusCode == 200) {
      final results = response.body['products'] as List<dynamic>;
      _recommendedrProducts = results
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

  List<ProductsModel> flattenBestSellerProducts() {
    List<ProductsModel> products = [];
    for (int i = 0; i < _allCategoryProducts.length; i++) {
      for (int j = 0; j < _allCategoryProducts[i].length; j++) {
        products.add(_allCategoryProducts[i][j]);
      }
    }
    return products;
  }

  bool _isStartingScrolling = false;
  bool get isStartingScrolling => _isStartingScrolling;

  set setIsStartingScrolling(bool value) {
    _isStartingScrolling = value;
    update();
  }
}
