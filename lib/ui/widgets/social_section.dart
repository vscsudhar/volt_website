import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/animated_hover_card.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
      color: kcSurfaceLight,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 24 : 36),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: kcBorderLight),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: kcPrimaryLight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'COMMUNITY & UPDATES',
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
              'Stay Connected With VoltSpare',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: isMobile ? 22 : 28,
                fontWeight: FontWeight.w800,
                color: kcTextDark,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Follow VoltSpare for new spare parts, maintenance tips, EV updates and useful two-wheeler information.',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: isMobile ? 13 : 15,
                color: kcTextSecondary,
              ),
            ),

            verticalSpaceLarge,

            // Social Cards Row
            Wrap(
              spacing: 16,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _buildSocialTile(
                  context,
                  platform: 'YouTube',
                  handle: '@VoltSpareOfficial',
                  icon: Icons.video_library_rounded,
                  color: const Color(0xFFFF0000),
                  subtitle: 'DIY Spares & EV Maintenance Guides',
                ),
                _buildSocialTile(
                  context,
                  platform: 'Instagram',
                  handle: '@VoltSpare_India',
                  icon: Icons.camera_alt_rounded,
                  color: const Color(0xFFE1306C),
                  subtitle: 'New Spares & Rider Tips',
                ),
                _buildSocialTile(
                  context,
                  platform: 'Facebook',
                  handle: '/VoltSpare',
                  icon: Icons.facebook_rounded,
                  color: const Color(0xFF1877F2),
                  subtitle: 'Garage Network & Community Updates',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialTile(
    BuildContext context, {
    required String platform,
    required String handle,
    required IconData icon,
    required Color color,
    required String subtitle,
  }) {
    return AnimatedHoverCard(
      liftOffset: -4,
      scaleMultiplier: 1.02,
      glowColor: color,
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'VoltSpare $platform channel link will be connected soon!'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: kcDarkSlate,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        width: 270,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kcSurfaceLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kcBorderLight),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    platform,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: kcTextDark,
                    ),
                  ),
                  Text(
                    handle,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: kcPrimaryColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      color: kcTextMuted,
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
}
