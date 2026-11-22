import 'cart_model.dart';

class PlaceOrderBody {
  late List<CartModel> cart;
  late String orderAmount;
  late String address;
  late String paymentMethod;
  late String orderNote;
  late String deliveryOptions;
  late double distance;
  late String latitude;
  late String longitude;
  late String contactPersonName;
  late String contactPersonNumber;
  late String deliveryCharge;

  PlaceOrderBody({
    required this.cart,
    required this.address,
    required this.contactPersonName,
    required this.contactPersonNumber,
    required this.distance,
    required this.latitude,
    required this.longitude,
    required this.orderAmount,
    required this.orderNote,
    required this.deliveryOptions,
    required this.paymentMethod, // or OrderType
    required this.deliveryCharge,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['cart'] = cart.map((e) => e.toJson()).toList();
    data['order_amount'] = orderAmount;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['contact_person_name'] = contactPersonName;
    data['contact_person_number'] = contactPersonNumber;
    data['distance'] = distance;
    data['order_note'] = orderNote;
    data['delivery_options'] = deliveryOptions;
    data['payment_method'] = paymentMethod;
    data['delivery_charge'] = deliveryCharge;

    return data;
  }

  factory PlaceOrderBody.fromJson(Map<String, dynamic> json) {
    return PlaceOrderBody(
      cart: json['cart'],
      orderNote: json['order_note'],
      orderAmount: json['order_amount'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      distance: json['distance'],
      contactPersonName: json['contact_person_name'],
      contactPersonNumber: json['contact_person_number'],
      address: json['address'],
      paymentMethod: json['payment_method'],
      deliveryOptions: json['delivery_options'],
      deliveryCharge: json['delivery_charge'],
    );
  }
}
