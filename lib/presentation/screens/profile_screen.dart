import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/domain/entities/user_entity.dart';
import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:campus_bites/presentation/providers/users/user_provider.dart';
import 'package:campus_bites/presentation/providers/users/user_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:campus_bites/presentation/widgets/shared/responsive_food_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  UserEntity? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    try {
      final userId = GlobalUser().currentUser?.id;
      if (userId == null) {
        throw Exception("No user ID found in GlobalUser.");
      }

      final userNotifier = ref.read(getUsersProvider.notifier);
      final user = await userNotifier.fetchById(userId);

      if (user == null) {
        throw Exception("User not found");
      }

      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching user: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _launchReport() async {
    final Uri reportUri = Uri.parse(
        "https://lookerstudio.google.com/reporting/4ed6b728-d031-424c-b123-63044acdb870");
    if (!await launchUrl(reportUri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $reportUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_user == null) {
      return const Scaffold(
        body: Center(child: Text("Error loading user data")),
      );
    }

    final bool isAnalyst = _user!.role == "analyst";

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _profileHeader(),
                        _buildSectionTitle("Contact information"),
                        _buildContactInfo(Icons.email, _user!.email),
                        _buildContactInfo(Icons.phone, _user!.phone),
                        _buildContactInfo(
                          Icons.location_on,
                          _user!.institution?.name ?? 'No institution available',
                        ),
                        if (isAnalyst)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: _launchReport,
                              child: const Text("Go to report"),
                            ),
                          ),
                        _buildSectionTitle("Saved products"),
                        _buildProducts(_user?.savedProducts),
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
      color: const Color(0xFF11203A),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            _user!.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF9A825),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              if (_user!.role.isNotEmpty) _buildNonClickableTag(_user!.role),
              if (_user!.isPremium) _buildNonClickableTag("premium"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNonClickableTag(String tagName) {
    return Chip(
      label: Text(
        tagName,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFF9A825),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF277A46),
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF277A46)),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildProducts(List<ProductEntity>? savedProducts) {
    if (savedProducts == null || savedProducts.isEmpty) {
      return const Text('No saved products to show');
    }

    return ResponsiveFoodList(food: savedProducts);
  }
}
