import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/widgets/volt_spare_logo.dart';

class MobileDrawer extends StatelessWidget {
  final Function(String section) onNavigate;

  const MobileDrawer({
    super.key,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: kcDarkSlate,
                border: Border(bottom: BorderSide(color: Color(0xFF1E293B))),
              ),
              child: const Row(
                children: [
                  VoltSpareLogo(
                    height: 38,
                    isDarkBackground: true,
                  ),
                ],
              ),
            ),

            // Links List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  _buildDrawerItem(
                    icon: Icons.home_rounded,
                    title: 'Home',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('home');
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.category_rounded,
                    title: 'All Categories',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('categories');
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.electric_scooter_rounded,
                    title: 'EV Spare Parts',
                    badge: '12 Categories',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('ev-parts');
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.two_wheeler_rounded,
                    title: 'Petrol Bike / Scooter Parts',
                    badge: '13 Categories',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('petrol-parts');
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.directions_bike_rounded,
                    title: 'Supported Vehicle Brands',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('brands');
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.local_shipping_rounded,
                    title: 'Same-Day Delivery Info',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('delivery');
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.support_agent_rounded,
                    title: '24/6 Customer Support',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('support');
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.info_outline_rounded,
                    title: 'About VoltSpare',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('about');
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.contact_mail_rounded,
                    title: 'Contact & Enquiry',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('contact');
                    },
                  ),
                  const Divider(color: kcBorderLight),
                  _buildDrawerItem(
                    icon: Icons.article_outlined,
                    title: 'Terms & Conditions',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('terms-and-conditions');
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('privacy-policy');
                    },
                  ),
                ],
              ),
            ),

            // Bottom Enquiry CTA
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    onNavigate('contact');
                  },
                  icon: const Icon(Icons.send_rounded,
                      size: 16, color: Colors.white),
                  label: const Text('Enquire Spare Part'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kcPrimaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    String? badge,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: kcPrimaryColor, size: 22),
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: kcTextDark,
        ),
      ),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: kcPrimaryLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                badge,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: kcPrimaryDark,
                ),
              ),
            )
          : null,
      onTap: onTap,
    );
  }
}
