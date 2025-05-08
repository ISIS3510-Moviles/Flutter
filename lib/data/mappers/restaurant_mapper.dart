import 'package:campus_bites/data/mappers/comment_mapper.dart';
import 'package:campus_bites/data/mappers/product_mapper.dart';
import 'package:campus_bites/data/models/restaurant_backend.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';

class RestaurantMapper {
  static RestaurantEntity restaurantBackendToEntity(
      RestaurantBackend restaurantBackend) {
    return RestaurantEntity(
      id: restaurantBackend.id,
      name: restaurantBackend.name,
      description: restaurantBackend.description,
      latitude: restaurantBackend.latitude,
      longitude: restaurantBackend.longitude,
      routeIndications: restaurantBackend.routeIndications,
      openingTime: restaurantBackend.openingTime,
      closingTime: restaurantBackend.closingTime,
      opensHolidays: restaurantBackend.opensHolidays,
      opensWeekends: restaurantBackend.opensWeekends,
      isActive: restaurantBackend.isActive,
      rating: restaurantBackend.rating,
      address: restaurantBackend.address,
      phone: restaurantBackend.phone,
      email: restaurantBackend.email,
      overviewPhoto: restaurantBackend.overviewPhoto,
      profilePhoto: restaurantBackend.profilePhoto,
      photos: restaurantBackend.photos,
      foodTagsIds: restaurantBackend.foodTagsIds,
      dietaryTagsIds: restaurantBackend.dietaryTagsIds,
      tags: restaurantBackend.tags,
      alertsIds: restaurantBackend.alertsIds,
      reservationsIds: restaurantBackend.reservationsIds,
      suscribersIds: restaurantBackend.suscribersIds,
      visitsIds: restaurantBackend.visitsIds,
      commentsIds: restaurantBackend.commentsIds,
      comments: restaurantBackend.comments
              ?.map((e) => CommentMapper.commentBackendToEntity(e))
              .toList() ??
          [],
      productsIds: restaurantBackend.productsIds,
      products: restaurantBackend.products
              ?.map((e) => ProductMapper.productBackendToEntity(e))
              .toList() ??
          [],
    );
  }

  static RestaurantBackend restaurantEntityToBackend(RestaurantEntity entity) {
    return RestaurantBackend(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      latitude: entity.latitude,
      longitude: entity.longitude,
      routeIndications: entity.routeIndications,
      openingTime: entity.openingTime,
      closingTime: entity.closingTime,
      opensHolidays: entity.opensHolidays,
      opensWeekends: entity.opensWeekends,
      isActive: entity.isActive,
      rating: entity.rating,
      address: entity.address,
      phone: entity.phone,
      email: entity.email,
      overviewPhoto: entity.overviewPhoto,
      profilePhoto: entity.profilePhoto,
      photos: entity.photos,
      foodTagsIds: entity.foodTagsIds,
      dietaryTagsIds: entity.dietaryTagsIds,
      tags: entity.tags,
      alertsIds: entity.alertsIds,
      reservationsIds: entity.reservationsIds,
      suscribersIds: entity.suscribersIds,
      visitsIds: entity.visitsIds,
      commentsIds: entity.commentsIds,
      productsIds: entity.productsIds,
    );
  }
}
