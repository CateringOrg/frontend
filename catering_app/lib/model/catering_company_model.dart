class CateringCompanyDTO {
  final String id;
  final String name;
  final String address;
  final String nip;

  CateringCompanyDTO({
    required this.id,
    required this.name,
    required this.address,
    required this.nip,
  });

  factory CateringCompanyDTO.fromJson(Map<String, dynamic> json) {
    return CateringCompanyDTO(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      nip: json['nip'],
    );
  }
}
