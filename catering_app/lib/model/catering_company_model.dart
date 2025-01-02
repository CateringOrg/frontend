class CateringCompanyDTO {
  final String id;
  final String name;
  final String address;
  final String phoneNumber;

  CateringCompanyDTO({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
  });

  factory CateringCompanyDTO.fromJson(Map<String, dynamic> json) {
    return CateringCompanyDTO(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
