class RestaurantBackend {
  final String id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final String routeIndications;
  final DateTime openingTime;
  final DateTime closingTime;
  final bool opensHolidays;
  final bool opensWeekends;
  final bool isActive;
  final double? rating;
  final String? address;
  final String? phone;
  final String? email;
  final String? overviewPhoto;
  final String? profilePhoto;
  final List<String>? photos;
  final List<String>? foodTagsIds;
  final List<String>? dietaryTagsIds;
  final List<String>? alertsIds;
  final List<String>? reservationsIds;
  final List<String>? suscribersIds;
  final List<String>? visitsIds;
  final List<String>? commentsIds;
  final List<String>? productsIds;

  RestaurantBackend({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.routeIndications,
    required this.openingTime,
    required this.closingTime,
    required this.opensHolidays,
    required this.opensWeekends,
    required this.isActive,
    this.rating,
    this.address,
    this.phone,
    this.email,
    this.overviewPhoto,
    this.profilePhoto,
    this.photos,
    this.foodTagsIds,
    this.dietaryTagsIds,
    this.alertsIds,
    this.reservationsIds,
    this.suscribersIds,
    this.visitsIds,
    this.commentsIds,
    this.productsIds,
  });

  factory RestaurantBackend.fromJson(Map<String, dynamic> json) {
    return RestaurantBackend(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      routeIndications: json['routeIndications'],
      openingTime: DateTime.parse(json['openingTime']),
      closingTime: DateTime.parse(json['closingTime']),
      opensHolidays: json['opensHolidays'],
      opensWeekends: json['opensWeekends'],
      isActive: json['isActive'],
      rating: json['rating']?.toDouble(),
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      overviewPhoto: json['overviewPhoto'],
      profilePhoto: json['profilePhoto'],
      photos: json['photos'] != null ? List<String>.from(json['photos']) : null,
      foodTagsIds: json['foodTagsIds'] != null ? List<String>.from(json['foodTagsIds']) : null,
      dietaryTagsIds: json['dietaryTagsIds'] != null ? List<String>.from(json['dietaryTagsIds']) : null,
      alertsIds: json['alertsIds'] != null ? List<String>.from(json['alertsIds']) : null,
      reservationsIds: json['reservationsIds'] != null ? List<String>.from(json['reservationsIds']) : null,
      suscribersIds: json['suscribersIds'] != null ? List<String>.from(json['suscribersIds']) : null,
      visitsIds: json['visitsIds'] != null ? List<String>.from(json['visitsIds']) : null,
      commentsIds: json['commentsIds'] != null ? List<String>.from(json['commentsIds']) : null,
      productsIds: json['productsIds'] != null ? List<String>.from(json['productsIds']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'routeIndications': routeIndications,
      'openingTime': openingTime.toIso8601String(),
      'closingTime': closingTime.toIso8601String(),
      'opensHolidays': opensHolidays,
      'opensWeekends': opensWeekends,
      'isActive': isActive,
      'rating': rating,
      'address': address,
      'phone': phone,
      'email': email,
      'overviewPhoto': overviewPhoto,
      'profilePhoto': profilePhoto,
      'photos': photos,
      'foodTagsIds': foodTagsIds,
      'dietaryTagsIds': dietaryTagsIds,
      'alertsIds': alertsIds,
      'reservationsIds': reservationsIds,
      'suscribersIds': suscribersIds,
      'visitsIds': visitsIds,
      'commentsIds': commentsIds,
      'productsIds': productsIds,
    };
  }
}
