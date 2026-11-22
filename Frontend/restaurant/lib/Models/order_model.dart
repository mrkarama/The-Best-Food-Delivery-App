class OrderModel {
  late int id;
  late int userId;
  String? orderAmount;
  String? orderStatus;
  String? paymentStatus;
  String? paymentMethod;
  double? totalTaxAmount;
  String? orderNote;
  String? createdAt;
  String? updatedAt;
  String? deliveryCharge;
  String? scheduleAt;
  int? otp;
  String? pending;
  String? accepted;
  String? confirmed;
  String? processing;
  String? handover;
  String? pickedUp;
  String? delivered;
  String? canceled;
  String? refundRequest;
  String? refunded;
  int? scheduled;
  String? failed;
  int? detailsCount;

  OrderModel(
      {required this.id,
      required this.userId,
      this.accepted,
      this.canceled,
      this.confirmed,
      this.createdAt,
      this.delivered,
      this.deliveryCharge,
      this.detailsCount,
      this.failed,
      this.handover,
      this.orderAmount,
      this.orderNote,
      this.orderStatus,
      this.otp,
      this.paymentStatus,
      this.pending,
      this.pickedUp,
      this.processing,
      this.refundRequest,
      this.scheduleAt,
      this.scheduled,
      this.totalTaxAmount,
      this.updatedAt,
      this.refunded,
      this.paymentMethod});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['user_id'] = userId;
    data['order_amount'] = orderAmount;
    data['order_status'] = orderStatus;
    data['payment_status'] = paymentStatus;
    data['payment_method'] = paymentMethod;
    data['total_tax_amount'] = totalTaxAmount;
    data['oder_note'] = orderNote;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['delivery_charge'] = deliveryCharge;
    data['schedule_at'] = scheduleAt;
    data['otp'] = otp;
    data['pending'] = pending;
    data['accepted'] = accepted;
    data['confirmed'] = confirmed;
    data['processing'] = processing;
    data['handover'] = handover;
    data['picked_up'] = pickedUp;
    data['delivered'] = delivered;
    data['canceled'] = canceled;
    data['refund_request'] = refundRequest;
    data['refunded'] = refunded;
    data['scheduled'] = scheduled;
    data['failed'] = failed;
    data['details_count'] = detailsCount;
    return data;
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['user_id'] ?? -1,
      orderAmount: json['order_amount'],
      orderStatus: json['order_status'],
      paymentStatus: json['payment_status'],
      paymentMethod: json['payment_method'],
      totalTaxAmount: json['total_tax_amount'],
      orderNote: json['order_note'],
      scheduleAt: json['schedule_at'],
      canceled: json['canceled'],
      confirmed: json['confirmed'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pickedUp: json['picked_up'],
      pending: json['pending'],
      processing: json['processing'],
      delivered: json['delivered'],
      deliveryCharge: json['delivery_charge'],
      detailsCount: json['details_count'],
      failed: json['failed'],
      refundRequest: json['refund_request'],
      refunded: json['refunded'],
      otp: json['otp'],
      handover: json['handover'],
      accepted: json['accepted'],
      scheduled: json['scheduled'],
    );
  }
}
