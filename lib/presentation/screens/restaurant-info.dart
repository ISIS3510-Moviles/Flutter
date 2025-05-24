import 'package:campus_bites/data/datasources/restaurant_backend_datasource.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/globals/GlobalRestaurant.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar_restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantInfo {
  String mainPhoto = '';
  String homePhoto = '';
  String description = '';
  double latitude = 0;
  double longitude = 0;
  String locationDescription = '';

  @override
  String toString() {
    return 'Main photo: $mainPhoto\nHome photo: $homePhoto\nDescription: $description\nCoordinates: ($latitude, $longitude)\nLocation: $locationDescription';
  }
}

class RestaurantInfoScreen extends StatefulWidget {
  const RestaurantInfoScreen({super.key});

  @override
  State<RestaurantInfoScreen> createState() => _RestaurantInfoScreenState();
}

class _RestaurantInfoScreenState extends State<RestaurantInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final info = RestaurantInfo();

  final mainPhotoController = TextEditingController();
  final homePhotoController = TextEditingController();
  final descriptionController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final locationDescriptionController = TextEditingController();

  final _datasource = RestaurantBackendDatasource();

  @override
  void dispose() {
    mainPhotoController.dispose();
    homePhotoController.dispose();
    descriptionController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    locationDescriptionController.dispose();
    super.dispose();
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      final current = GlobalRestaurant().currentRestaurant!;

      final updatedRestaurant = RestaurantEntity(
        id: current.id,
        name: current.name,
        email: current.email,
        phone: current.phone,
        description: descriptionController.text,
        latitude: double.tryParse(latitudeController.text) ?? 0,
        longitude: double.tryParse(longitudeController.text) ?? 0,
        routeIndications: locationDescriptionController.text,
        openingTime: current.openingTime,
        closingTime: current.closingTime,
        opensHolidays: current.opensHolidays,
        opensWeekends: current.opensWeekends,
        isActive: current.isActive,
        address: current.address,
        overviewPhoto: mainPhotoController.text,
        profilePhoto: homePhotoController.text,
        comments: current.comments,
        photos: current.photos,
        foodTagsIds: current.foodTagsIds,
        dietaryTagsIds: current.dietaryTagsIds,
        tags: current.tags,
        alertsIds: current.alertsIds,
        reservationsIds: current.reservationsIds,
        suscribersIds: current.suscribersIds,
        visitsIds: current.visitsIds,
        commentsIds: current.commentsIds,
        productsIds: current.productsIds,
        products: current.products,
      );

      try {
        final result = await _datasource.updateRestaurant(updatedRestaurant);
        setState(() {
          GlobalRestaurant().currentRestaurant = result;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Restaurant updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Update failed: $e')),
        );
      }
    }
  }

  Widget _buildTextField(String label, String helper, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) => value == null || value.isEmpty ? 'Required' : null,
        decoration: InputDecoration(
          labelText: label,
          helperText: helper,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppbarRestaurant(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField('Main photo', 'The url of the photo restaurant', mainPhotoController),
                    _buildTextField('Home photo', 'The url of the home of the restaurant', homePhotoController),
                    _buildTextField('Restaurant description', 'The description of the restaurant', descriptionController),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Coordinates', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField('Latitude', 'Latitude', latitudeController, keyboardType: TextInputType.number),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildTextField('Longitude', 'Longitude', longitudeController, keyboardType: TextInputType.number),
                        ),
                      ],
                    ),
                    _buildTextField('Location description', 'The description of the location', locationDescriptionController),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _saveForm,
                        child: const Text('Update'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
