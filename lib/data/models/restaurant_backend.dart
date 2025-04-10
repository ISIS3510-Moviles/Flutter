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
  final List<String>? tags;

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
    this.tags,
  });

  factory RestaurantBackend.fromJson(Map<String, dynamic> json) {
    return RestaurantBackend(
      id: json['id'] as String? ?? 'Unknown ID',
      name: json['name'] as String? ?? 'Unknown Name',
      description: json['description'] as String? ?? 'No description',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      routeIndications: json['routeIndications'] as String? ?? 'No route indications',
      openingTime: json['openingTime'] != null
          ? DateTime.parse(json['openingTime'])
          : DateTime.now(),
      closingTime: json['closingTime'] != null
          ? DateTime.parse(json['closingTime'])
          : DateTime.now(),
      opensHolidays: json['opensHolidays'] as bool? ?? false,
      opensWeekends: json['opensWeekends'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toDouble(),
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      overviewPhoto: json['overviewPhoto'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
      photos: (json['photos'] as List<dynamic>?)
              ?.map((photo) => photo as String)
              .toList() ??
          [],
      foodTagsIds: json['foodTagsIds'] != null
          ? List<String>.from(json['foodTagsIds'])
          : null,
      dietaryTagsIds: json['dietaryTagsIds'] != null
          ? List<String>.from(json['dietaryTagsIds'])
          : null,
      alertsIds: json['alertsIds'] != null
          ? List<String>.from(json['alertsIds'])
          : null,
      reservationsIds: json['reservationsIds'] != null
          ? List<String>.from(json['reservationsIds'])
          : null,
      suscribersIds: json['suscribersIds'] != null
          ? List<String>.from(json['suscribersIds'])
          : null,
      visitsIds: json['visitsIds'] != null
          ? List<String>.from(json['visitsIds'])
          : null,
      commentsIds: json['commentsIds'] != null
          ? List<String>.from(json['commentsIds'])
          : null,
      productsIds: json['productsIds'] != null
          ? List<String>.from(json['productsIds'])
          : null,
      tags: json['tags'] != null
          ? List<String>.from(json['tags'])
          : null,
    );
  }
}