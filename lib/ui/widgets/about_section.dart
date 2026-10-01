import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/volt_spare_logo.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: kcSurfaceLight,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: kcBorderLight),
        ),
        padding: EdgeInsets.all(isMobile ? 24 : 40),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildAboutContent(isMobile),
                  ),
                  horizontalSpaceExtraLarge,
                  Expanded(
                    flex: 5,
                    child: _buildKeyPillarsGrid(),
                  ),
                ],
              )
            : Column(
                children: [
                  _buildAboutContent(isMobile),
                  verticalSpaceLarge,
                  _buildKeyPillarsGrid(),
                ],
              ),
      ),
    );
  }

  Widget _buildAboutContent(bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const VoltSpareLogo(height: 38),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: kcPrimaryLight,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'ABOUT VOLTSPARE',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: kcPrimaryDark,
              letterSpacing: 0.6,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Built for Every Two-Wheeler Ride',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.w800,
            color: kcTextDark,
            letterSpacing: -0.5,
          ),
        ),
        verticalSpaceMedium,
        Text(
          'VoltSpare was created to make finding genuine EV and petrol two-wheeler spare parts simple, reliable, and stress-free.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: kcTextDark,
            height: 1.5,
          ),
        ),
        verticalSpaceSmall,
        Text(
          'From high-torque regenerative brake shoes for electric scooters (Ola, Ather, Chetak) to trusted engine oils, filters, and cables for classic petrol motorcycles (Hero, Honda, Bajaj, Royal Enfield), VoltSpare bridges the discovery and delivery gap for riders, mechanics, and local workshops.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            color: kcTextSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildKeyPillarsGrid() {
    return Column(
      children: [
        _buildPillarTile(
          icon: Icons.electric_bolt_rounded,
          title: 'EV + Petrol Specialization',
          desc:
              'Dedicated parts knowledge for electric powertrains & IC engines.',
          color: kcPrimaryColor,
        ),
        const SizedBox(height: 12),
        _buildPillarTile(
          icon: Icons.check_circle_outline_rounded,
          title: 'Vehicle Compatibility',
          desc: 'Zero-guesswork model matching for precise fitment.',
          color: const Color(0xFF0284C7),
        ),
        const SizedBox(height: 12),
        _buildPillarTile(
          icon: Icons.support_agent_rounded,
          title: '24/6 Support & Local Speed',
          desc:
              'Instant help from knowledgeable technicians and prompt delivery.',
          color: const Color(0xFFEA580C),
        ),
      ],
    );
  }

  Widget _buildPillarTile({
    required IconData icon,
    required String title,
    required String desc,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kcBorderLight),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: kcTextDark,
                  ),
                ),
                Text(
                  desc,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    color: kcTextSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
