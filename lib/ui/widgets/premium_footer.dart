import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/volt_spare_logo.dart';

class PremiumFooter extends StatelessWidget {
  final Function(String section) onNavigate;

  const PremiumFooter({
    super.key,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Container(
      color: kcDarkSlate,
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Columns
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brand Column
                Expanded(flex: 4, child: _buildBrandCol()),
                horizontalSpaceLarge,
                // Navigation
                Expanded(flex: 2, child: _buildNavCol()),
                horizontalSpaceLarge,
                // Services
                Expanded(flex: 3, child: _buildServicesCol()),
                horizontalSpaceLarge,
                // Location & Contact
                Expanded(flex: 3, child: _buildLocationCol()),
              ],
            )
          else
            Wrap(
              spacing: 32,
              runSpacing: 32,
              children: [
                SizedBox(width: double.infinity, child: _buildBrandCol()),
                SizedBox(
                  width: isMobile ? double.infinity : 200,
                  child: _buildNavCol(),
                ),
                SizedBox(
                  width: isMobile ? double.infinity : 260,
                  child: _buildServicesCol(),
                ),
                SizedBox(
                  width: isMobile ? double.infinity : 280,
                  child: _buildLocationCol(),
                ),
              ],
            ),

          verticalSpaceLarge,
          const Divider(color: Color(0xFF1E293B)),
          verticalSpaceMedium,

          // Copyright Bottom Bar (Wrap layout prevents overflow on small/split screens)
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 10,
            children: [
              Text(
                '© 2026 VoltSpare. All Rights Reserved.',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  color: const Color(0xFF94A3B8),
                ),
              ),
              // Footer Legal Links
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => onNavigate('terms-and-conditions'),
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: Text(
                        'Terms & Conditions',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          color: const Color(0xFFCBD5E1),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      '|',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: const Color(0xFF475569),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => onNavigate('privacy-policy'),
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: Text(
                        'Privacy Policy',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          color: const Color(0xFFCBD5E1),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'EV & Petrol Two-Wheeler Spare Parts',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.bolt_rounded,
                      size: 14, color: kcPrimaryElectric),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBrandCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            VoltSpareLogo(
              height: 42,
              isDarkBackground: true,
            ),
          ],
        ),
        verticalSpaceMedium,
        Text(
          'EV + Petrol Two-Wheeler Spare Parts',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: kcPrimaryElectric,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Dedicated spare parts discovery, vehicle compatibility guidance, and local delivery platform for two-wheeler owners and mechanics.',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            color: const Color(0xFF94A3B8),
            height: 1.5,
          ),
        ),
        verticalSpaceMedium,
        // Social Media Icons
        Row(
          children: [
            _buildSocialIcon(Icons.video_library_rounded, 'YouTube'),
            const SizedBox(width: 8),
            _buildSocialIcon(Icons.camera_alt_rounded, 'Instagram'),
            const SizedBox(width: 8),
            _buildSocialIcon(Icons.facebook_rounded, 'Facebook'),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white70, size: 16),
    );
  }

  Widget _buildNavCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NAVIGATION',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        verticalSpaceSmall,
        _buildFooterLink('Home', () => onNavigate('home')),
        _buildFooterLink('Categories', () => onNavigate('categories')),
        _buildFooterLink('EV Parts', () => onNavigate('ev-parts')),
        _buildFooterLink('Petrol Parts', () => onNavigate('petrol-parts')),
        _buildFooterLink('Support', () => onNavigate('support')),
        _buildFooterLink('About VoltSpare', () => onNavigate('about')),
        _buildFooterLink('Contact & Enquiry', () => onNavigate('contact')),
        _buildFooterLink(
            'Terms & Conditions', () => onNavigate('terms-and-conditions')),
        _buildFooterLink(
            'Privacy Policy', () => onNavigate('privacy-policy')),
      ],
    );
  }

  Widget _buildServicesCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'KEY SERVICES',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        verticalSpaceSmall,
        _buildFooterLink('Same-Day Delivery (Order Before 3 PM)',
            () => onNavigate('delivery')),
        _buildFooterLink(
            '24/6 Dedicated Customer Support', () => onNavigate('support')),
        _buildFooterLink(
            'Free Shipping Above ₹999', () => onNavigate('delivery')),
        _buildFooterLink(
            'Vehicle Compatibility Check', () => onNavigate('contact')),
        _buildFooterLink(
            'Workshop Sourcing Assistance', () => onNavigate('contact')),
      ],
    );
  }

  Widget _buildLocationCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LOCATION & CONTACT',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        verticalSpaceSmall,
        _buildContactRow(
            Icons.location_on_outlined, 'Coimbatore, Tamil Nadu - 641004'),
        const SizedBox(height: 8),
        _buildContactRow(
            Icons.phone_in_talk_rounded, '+91 98421 24312'),
        const SizedBox(height: 8),
        _buildContactRow(Icons.email_outlined, 'support@voltspare.com'),
        const SizedBox(height: 12),
        const Divider(color: Color(0xFF1E293B)),
        const SizedBox(height: 6),
        Text(
          'LEGAL & COMPLIANCE',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF64748B),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        _buildFooterLink(
            'Terms & Conditions', () => onNavigate('terms-and-conditions')),
        _buildFooterLink(
            'Privacy Policy', () => onNavigate('privacy-policy')),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 15, color: kcPrimaryElectric),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              color: const Color(0xFFCBD5E1),
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooterLink(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            color: const Color(0xFF94A3B8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
