class EnquiryModel {
  final String? id;
  final String name;
  final String phone;
  final String brand;
  final String model;
  final String partName;
  final String message;
  final String status;
  final DateTime? createdAt;

  EnquiryModel({
    this.id,
    required this.name,
    required this.phone,
    required this.brand,
    required this.model,
    required this.partName,
    this.message = '',
    this.status = 'pending',
    this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'brand': brand,
    'model': model,
    'partName': partName,
    'message': message,
  };

  factory EnquiryModel.fromJson(Map<String, dynamic> json) {
    return EnquiryModel(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      partName: json['partName'] ?? '',
      message: json['message'] ?? '',
      status: json['status'] ?? 'pending',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'].toString())
          : null,
    );
  }
}
