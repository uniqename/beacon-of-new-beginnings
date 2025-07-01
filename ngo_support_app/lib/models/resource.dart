class Resource {
  final String id;
  final String name;
  final String description;
  final String category;
  final String phoneNumber;
  final String website;
  final String address;
  final bool isEmergency;
  final double? latitude;
  final double? longitude;
  final String? email;
  final String? operatingHours;
  final String? availabilityStatus;
  final bool verified;

  const Resource({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.phoneNumber,
    required this.website,
    required this.address,
    required this.isEmergency,
    this.latitude,
    this.longitude,
    this.email,
    this.operatingHours,
    this.availabilityStatus,
    this.verified = false,
  });

  factory Resource.fromMap(Map<String, dynamic> map) {
    return Resource(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      phoneNumber: map['phone'] ?? map['phoneNumber'] ?? '',
      website: map['website'] ?? '',
      address: map['address'] ?? '',
      isEmergency: map['isEmergency'] ?? false,
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      email: map['email'],
      operatingHours: map['operating_hours'],
      availabilityStatus: map['availability_status'],
      verified: map['verified'] == 1 || map['verified'] == true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'phone': phoneNumber,
      'website': website,
      'address': address,
      'isEmergency': isEmergency,
      'latitude': latitude,
      'longitude': longitude,
      'email': email,
      'operating_hours': operatingHours,
      'availability_status': availabilityStatus,
      'verified': verified ? 1 : 0,
    };
  }

  Resource copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    String? phoneNumber,
    String? website,
    String? address,
    bool? isEmergency,
  }) {
    return Resource(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      website: website ?? this.website,
      address: address ?? this.address,
      isEmergency: isEmergency ?? this.isEmergency,
    );
  }
}