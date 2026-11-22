class AddressModel {
  final int userId;
  final String addressType;
  final String contactPersonName;
  final String contactPersonNumber;
  final String address;
  final String latitude;
  final String longitude;

  AddressModel({
    required this.userId,
    required this.addressType,
    required this.contactPersonName,
    required this.contactPersonNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'address_type': addressType,
      'contact_person_name': contactPersonName,
      'contact_person_number': contactPersonNumber,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      userId: json['user_id'],
      addressType: json['address_type'],
      contactPersonName: json['contact_person_name'],
      contactPersonNumber: json['contact_person_number'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
