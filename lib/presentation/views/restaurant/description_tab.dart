import 'package:flutter/material.dart';

class DescriptionTab extends StatelessWidget {
  const DescriptionTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',
              fit: BoxFit.cover,
            ),
          ),
      
          SizedBox(
            width: double.infinity,
            child: Text('Description', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Text('Amet amet adipisicing eiusmod tempor veniam. Excepteur voluptate ut eiusmod nostrud officia dolore anim occaecat ad aute commodo. Ex aliquip Lorem commodo reprehenderit anim fugiat velit.'),
          Text('Amet amet adipisicing eiusmod tempor veniam. Excepteur voluptate ut eiusmod nostrud officia dolore anim occaecat ad aute commodo. Ex aliquip Lorem commodo reprehenderit anim fugiat velit.'),
        ],
      ),
    );
  }
}
