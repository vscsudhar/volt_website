import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/animated_hover_card.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
      color: kcSurfaceLight,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
                    child: _buildTextContent(isMobile),
                  ),
                  horizontalSpaceExtraLarge,
                  Expanded(
                    flex: 5,
                    child: _buildDeliveryVisualCard(),
                  ),
                ],
              )
            : Column(
                children: [
                  _buildTextContent(isMobile),
                  verticalSpaceLarge,
                  _buildDeliveryVisualCard(),
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
            color: kcPrimaryLight,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'FAST LOCAL FULFILLMENT',
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
          'Fast Delivery When You Need It',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.w800,
            color: kcTextDark,
            letterSpacing: -0.5,
          ),
        ),
        verticalSpaceMedium,
        // Primary Highlight
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: kcPrimaryLight,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kcPrimaryColor.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.flash_on_rounded,
                  color: kcPrimaryDark, size: 22),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  'Order Before 3 PM → Same-Day Delivery',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: kcPrimaryDark,
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpaceMedium,
        Text(
          'Same-day delivery is available for eligible in-stock items and service areas.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kcTextDark,
            height: 1.5,
          ),
        ),
        verticalSpaceSmall,
        Text(
          'Stocked in our local Coimbatore fulfillment hub for rapid regional dispatch directly to mechanic garages, workshops, and two-wheeler owners.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            color: kcTextSecondary,
            height: 1.4,
          ),
        ),
        verticalSpaceMedium,
        // Free Shipping Highlight
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_rounded,
                color: kcPrimaryColor, size: 18),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Free Shipping Above ₹999 across eligible orders',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: kcTextDark,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryVisualCard() {
    return AnimatedHoverCard(
      liftOffset: -4,
      scaleMultiplier: 1.01,
      glowColor: kcPrimaryElectric,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: kcDarkSlate,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kcPrimaryDark,
                ),
                child: const Icon(Icons.local_shipping_rounded,
                    color: kcPrimaryElectric, size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                'Dispatch Timelines',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          verticalSpaceMedium,
          _buildDeliveryStep(
            'Order Placed by 3:00 PM',
            'Same-day local dispatch from Coimbatore warehouse hub',
            Icons.timer_rounded,
          ),
          _buildDeliveryStep(
            'Coimbatore & Western TN',
            'Express delivery within 24 hours to workshops & doorsteps',
            Icons.location_city_rounded,
          ),
          _buildDeliveryStep(
            'South India Wide',
            'Safe parcel dispatch with express tracking within 24-48 hours',
            Icons.map_rounded,
          ),
        ],
      ),
    ),
  );
}

  Widget _buildDeliveryStep(String title, String desc, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: kcPrimaryElectric, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  desc,
                  style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF94A3B8),
                    fontSize: 11,
                    height: 1.3,
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
