import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/animated_hover_card.dart';

class VehicleCompatibilitySection extends StatelessWidget {
  final VoidCallback onAskPart;

  const VehicleCompatibilitySection({
    super.key,
    required this.onAskPart,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
      child: Container(
        padding: EdgeInsets.all(isMobile ? 24 : 40),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF064E3B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 7,
                    child: _buildTextContent(isMobile),
                  ),
                  horizontalSpaceLarge,
                  Expanded(
                    flex: 4,
                    child: _buildActionCard(),
                  ),
                ],
              )
            : Column(
                children: [
                  _buildTextContent(isMobile),
                  verticalSpaceLarge,
                  _buildActionCard(),
                ],
              ),
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'EXPERT COMPATIBILITY ASSISTANCE',
            style: GoogleFonts.plusJakartaSans(
              color: kcPrimaryElectric,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
            ),
          ),
        ),
        verticalSpaceSmall,
        Text(
          'Looking for a Part for Your Vehicle?',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        verticalSpaceSmall,
        Text(
          'Tell us your vehicle brand, model and the part you need. Our team can help you identify the right spare part.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: isMobile ? 14 : 16,
            color: const Color(0xFFCBD5E1),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard() {
    return AnimatedHoverCard(
      liftOffset: -4,
      scaleMultiplier: 1.02,
      glowColor: kcPrimaryElectric,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.verified_user_rounded,
                    color: kcPrimaryElectric, size: 20),
                const SizedBox(width: 8),
                Text(
                  '100% Fitment Guarantee',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onAskPart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcPrimaryAccent,
                  foregroundColor: const Color(0xFF042F2C),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.send_rounded,
                        size: 16, color: Color(0xFF042F2C)),
                    const SizedBox(width: 8),
                    Text(
                      'Ask About a Spare Part',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF042F2C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
