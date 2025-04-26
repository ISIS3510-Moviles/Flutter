import 'package:campus_bites/domain/entities/comment_entity.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:isar/isar.dart';

part 'restaurant_entity.g.dart';

@collection
class RestaurantEntity {
  Id? isarId;

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
  final List<String>? tags;
  @ignore
  final List<CommentEntity>? comments;
  final List<String>? dietaryTagsIds;
  final List<String>? alertsIds;
  final List<String>? reservationsIds;
  final List<String>? suscribersIds;
  final List<String>? visitsIds;
  final List<String>? commentsIds;
  final List<String>? productsIds;
  @ignore
  final List<ProductEntity>? products;

  late final DateTime cachedAt;

  RestaurantEntity({
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
    this.comments, 
    this.profilePhoto,
    this.photos,
    this.foodTagsIds,
    this.dietaryTagsIds,
    this.tags,
    this.alertsIds,
    this.reservationsIds,
    this.suscribersIds,
    this.visitsIds,
    this.commentsIds,
    this.productsIds,
    this.products,
  });
}
