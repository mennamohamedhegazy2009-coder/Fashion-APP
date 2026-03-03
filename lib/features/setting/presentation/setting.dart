import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/setting/presentation/editprofile.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _buildSectionTitle("Account"),
          _buildSettingsGroup([
            _buildSettingsItem(Icons.person_outline, "Edit profile", context),
            _buildSettingsItem(Icons.security, "security", context),
            _buildSettingsItem(Icons.notifications_none, "Notifications", context),
            _buildSettingsItem(Icons.lock_outline, "Privacy", context),
          ]),
          const SizedBox(height: 25),
          _buildSectionTitle("Support & About"),
          _buildSettingsGroup([
            _buildSettingsItem(Icons.credit_card, "My Subscribtion", context),
            _buildSettingsItem(Icons.help_outline, "Help & Support", context),
            _buildSettingsItem(Icons.info_outline, "Terms and Policies", context),
          ]),
          const SizedBox(height: 25),
          _buildSectionTitle("Cache & cellular"),
          _buildSettingsGroup([
            _buildSettingsItem(Icons.delete_outline, "Free up space", context),
            _buildSettingsItem(Icons.data_saver_off, "Data Saver", context),
          ]),
          const SizedBox(height: 25),
          _buildSectionTitle("Actions"),
          _buildSettingsGroup([
            _buildSettingsItem(Icons.flag_outlined, "Report a problem", context),
            _buildSettingsItem(Icons.people_outline, "Add account", context),
            _buildSettingsItem(Icons.logout, "Log out", context),
          ]),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: items,
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87, size: 24),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {
        if (title == "Edit profile") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditProfileScreen(), 
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailScreen(categoryName: title),
            ),
          );
        }
      },
    );
  }
}
class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;
  const CategoryDetailScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: const Color(0xFFF83758),
      ),
      body: Center(
        child: Text("Welcome to $categoryName Page"),
      ),
    );
  }
}