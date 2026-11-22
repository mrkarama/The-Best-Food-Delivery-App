class UserInfo {
  final int id;
  final String name;
  final int orderCount;
  final String email;
  final String phone;

  UserInfo({
    required this.id,
    required this.email,
    required this.name,
    required this.orderCount,
    required this.phone,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      orderCount: json['order_count'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'orderCount': orderCount,
      'phone': phone,
    };
  }
}
