class LoginModel {
  final String name;
  final String password;
  final String email;
  final String phone;

  LoginModel({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}
