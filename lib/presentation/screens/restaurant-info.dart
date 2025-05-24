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

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        info.mainPhoto = mainPhotoController.text;
        info.homePhoto = homePhotoController.text;
        info.description = descriptionController.text;
        info.latitude = double.tryParse(latitudeController.text) ?? 0;
        info.longitude = double.tryParse(longitudeController.text) ?? 0;
        info.locationDescription = locationDescriptionController.text;
      });

      print(info.toString());
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
      appBar: AppBar(title: const Text('Restaurant information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Main photo', 'The url of the photo restaurant', mainPhotoController),
              _buildTextField('Home photo', 'The url of the home of the restaurant', homePhotoController),
              _buildTextField('Restaurant description', 'The description of the restaurant', descriptionController),
              const SizedBox(height: 10),
              const Text('Coordinates', style: TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }
}