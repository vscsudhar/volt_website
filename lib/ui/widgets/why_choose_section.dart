import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/animated_hover_card.dart';

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    final features = [
      (
        icon: Icons.category_rounded,
        image: 'assets/images/features/wide_spare_parts.webp',
        title: 'Wide Spare Parts Categories',
        desc: 'EV and petrol two-wheeler parts in one specialized catalogue.',
      ),
      (
        icon: Icons.check_circle_outline_rounded,
        image: 'assets/images/features/vehicle_compatibility.webp',
        title: 'Vehicle Compatibility Support',
        desc: 'Guaranteed fitment guidance for all popular 2-wheeler models.',
      ),
      (
        icon: Icons.flash_on_rounded,
        image: 'assets/images/features/same_day_delivery.webp',
        title: 'Same-Day Delivery',
        desc: 'Rapid local dispatch for eligible in-stock orders before 3 PM.',
      ),
      (
        icon: Icons.support_agent_rounded,
        image: 'assets/images/features/support.webp',
        title: '24/6 Support',
        desc: 'Dedicated customer support and mechanical parts assistance.',
      ),
      (
        icon: Icons.inventory_2_rounded,
        image: 'assets/images/features/free_shipping.webp',
        title: 'Free Shipping',
        desc: 'Enjoy free delivery across Tamil Nadu on orders above ₹999.',
      ),
      (
        icon: Icons.storefront_rounded,
        image: 'assets/images/features/local_service.webp',
        title: 'Local Service Hubs',
        desc: 'Centrally situated in Coimbatore for fast regional turnaround.',
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Eyebrow and Heading
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: kcPrimaryLight,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'THE VOLTSPARE PROMISE',
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
            'Why Choose VoltSpare',
            style: GoogleFonts.plusJakartaSans(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.w800,
              color: kcTextDark,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Designed specifically for two-wheeler owners, workshop mechanics, and electric mobility riders.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: isMobile ? 13 : 15,
              color: kcTextSecondary,
            ),
          ),

          verticalSpaceLarge,

          // 6 Feature Cards with safe responsive grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 3;
              if (constraints.maxWidth < 620) {
                crossAxisCount = 1;
              } else if (constraints.maxWidth < 1050) {
                crossAxisCount = 2;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: features.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: crossAxisCount == 1 ? 210 : 230,
                ),
                itemBuilder: (context, index) {
                  final f = features[index];
                  return _buildFeatureCard(
                    icon: f.icon,
                    image: f.image,
                    title: f.title,
                    desc: f.desc,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String image,
    required String title,
    required String desc,
  }) {
    return AnimatedHoverCard(
      liftOffset: -4,
      scaleMultiplier: 1.015,
      glowColor: kcPrimaryColor,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: kcSurfaceLight,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: kcBorderLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Feature 3D Visual
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kcBorderLight.withValues(alpha: 0.6)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: kcPrimaryLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: kcPrimaryDark, size: 24),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: kcTextDark,
              ),
            ),
            const SizedBox(height: 3),
            Expanded(
              child: Text(
                desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11.5,
                  color: kcTextSecondary,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
