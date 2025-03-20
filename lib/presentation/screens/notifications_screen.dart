import 'package:campus_bites/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NotificationCard(
                          imageUrl: 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',
                          title: 'Starbucks (Andes)',
                          description: 'We have changed our oppening time. We are now open from 8:00 to 20:00',
                          date: '10 minutes ago',
                        ),
                        NotificationCard(
                          imageUrl: 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',
                          title: 'Starbucks (Andes)',
                          description: 'Thank you for reserving table 1 on Thursday at 11:00',
                          date: '15 minutes ago',
                        ),
                      ],
                    )
                  );
                },
                childCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  
  const NotificationCard({
    super.key, required this.imageUrl, required this.title, required this.description, required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(description, style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      Text(date, style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}