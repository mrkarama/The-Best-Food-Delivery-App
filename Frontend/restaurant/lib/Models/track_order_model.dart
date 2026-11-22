class TrackOrderModel {
  final int id;
  final int orderId;
  final int orderPlaced;
  final int orderConfirmed;
  final int orderShipped;
  final int orderDelivered;

  TrackOrderModel({
    required this.id,
    required this.orderId,
    required this.orderConfirmed,
    required this.orderDelivered,
    required this.orderPlaced,
    required this.orderShipped,
  });

  factory TrackOrderModel.fromJson(Map<String, dynamic> json) {
    return TrackOrderModel(
      id: json['id'],
      orderId: json['order_id'],
      orderConfirmed: json['order_confirmed'],
      orderDelivered: json['order_delivered'],
      orderPlaced: json['order_placed'],
      orderShipped: json['order_shipped'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'order_placed': orderPlaced,
      'order_confirmed': orderConfirmed,
      'order_shipped': orderShipped,
      'order_delivered': orderDelivered
    };
  }
}
