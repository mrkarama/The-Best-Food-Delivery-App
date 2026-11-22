import 'package:restaurant/Commons/Utils/packages.dart';

extension BuildContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}

extension DoubleExtensions on double {
  double get TwoNumbersAfterDecimalPoint {
    return double.parse(this.toStringAsFixed(2));
  }
}
