import 'package:campus_bites/presentation/widgets/shared/tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:campus_bites/presentation/widgets/shared/responsive_food_list.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<Map<String, String>> food = [
    {
      'id': '1',
      'title': 'SeneTamale',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
    },
    {
      'id': '2',
      'title': 'Seneca Burguer',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
    },
    {
      'id': '3',
      'title': 'SeneTamale',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
    },
    {
      'id': '4',
      'title': 'Seneca Burguer',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
    },
    {
      'id': '5',
      'title': 'SeneTamale',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
    },
    {
      'id': '6',
      'title': 'Seneca Burguer',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
    },
    {
      'id': '7',
      'title': 'SeneTamale',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
    },
    {
      'id': '8',
      'title': 'Seneca Burguer',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
    },
    {
      'id': '9',
      'title': 'SeneTamale',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
    },
    {
      'id': '10',
      'title': 'Seneca Burguer',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
    },
    {
      'id': '11',
      'title': 'SeneTamale',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
    },
    {
      'id': '12',
      'title': 'Seneca Burguer',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
    },
    {
      'id': '13',
      'title': 'SeneTamale',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
    },
    {
      'id': '14',
      'title': 'Seneca Burguer',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
    },
    {
      'id': '15',
      'title': 'SeneTamale',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
    },
    {
      'id': '16',
      'title': 'Seneca Burguer',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
    },
    {
      'id': '17',
      'title': 'SeneTamale',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
    },
    {
      'id': '18',
      'title': 'Seneca Burguer',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
    },
    {
      'id': '19',
      'title': 'SeneTamale',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
    },
    {
      'id': '20',
      'title': 'Seneca Burguer',
      'price': '\$40.000',
      'subtitle': 'Seneca Food',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _profileHeader(),
                        _buildSectionTitle("Contact information"),
                        _buildContactInfo(Icons.email, "danielf4415@gmail.com"),
                        _buildContactInfo(Icons.phone, "3028389900"),
                        _buildContactInfo(Icons.location_on, "Los Andes"),
                        _buildSectionTitle("Dietary preferences"),
                        _buildTagWrap(
                            ["Vegetarian", "Vegan", "Vegan", "Vegan", "Vegan"]),
                        _buildSectionTitle("Saved products"),
                        _buildProducts(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Container(
      width: double.infinity,
      color: Color(0xFF11203A),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Daniel Diaz",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF9A825),
            ),
          ),
          SizedBox(height: 10),
          _buildTagWrap(["Admin", "Premium"]),
        ],
      ),
    );
  }

  Widget _buildTagWrap(List<String> tags) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: tags.map((tag) => TagChip(tagName: tag)).toList(),
    );
  }



  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF277A46)),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFF277A46)),
        SizedBox(width: 10),
        Text(text, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildProducts() {
    return ResponsiveFoodList(food: food);
  }
}
