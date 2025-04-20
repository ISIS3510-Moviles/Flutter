import 'package:campus_bites/data/models/restaurant_backend.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';

class RestaurantMapper {
  static RestaurantEntity restaurantBackendToEntity(RestaurantBackend restaurantBackend) {
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
      productsIds: restaurantBackend.productsIds,
    );
  }
}
