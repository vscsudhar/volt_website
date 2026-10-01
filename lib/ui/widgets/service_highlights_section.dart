import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/animated_hover_card.dart';

class ServiceHighlightsSection extends StatelessWidget {
  final VoidCallback onSupportTap;
  final VoidCallback onDeliveryTap;

  const ServiceHighlightsSection({
    super.key,
    required this.onSupportTap,
    required this.onDeliveryTap,
  });

  @override
  Widget build(BuildContext context) {
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Container(
      transform: Matrix4.translationValues(0.0, -28.0, 0.0),
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isStacked = constraints.maxWidth < 820;

          if (isStacked) {
            return Column(
              children: [
                _buildServiceCard(
                  icon: Icons.local_shipping_rounded,
                  badge: 'Order Before 3 PM',
                  title: 'Same-Day Delivery',
                  description:
                      'Eligible in-stock products can be delivered the same day when ordered before 3 PM.',
                  accentColor: kcPrimaryColor,
                  onTap: onDeliveryTap,
                ),
                const SizedBox(height: 14),
                _buildServiceCard(
                  icon: Icons.support_agent_rounded,
                  badge: '24/6 Support',
                  title: '24/6 Customer Support',
                  description:
                      'Get help with spare-parts enquiries, compatibility and support.',
                  accentColor: const Color(0xFF0284C7),
                  onTap: onSupportTap,
                ),
                const SizedBox(height: 14),
                _buildServiceCard(
                  icon: Icons.inventory_2_rounded,
                  badge: 'Free Shipping',
                  title: 'Free Shipping Above ₹999',
                  description:
                      'Enjoy free shipping on eligible orders above ₹999.',
                  accentColor: const Color(0xFFEA580C),
                  onTap: onDeliveryTap,
                ),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildServiceCard(
                  icon: Icons.local_shipping_rounded,
                  badge: 'Order Before 3 PM',
                  title: 'Same-Day Delivery',
                  description:
                      'Eligible in-stock products can be delivered the same day when ordered before 3 PM.',
                  accentColor: kcPrimaryColor,
                  onTap: onDeliveryTap,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildServiceCard(
                  icon: Icons.support_agent_rounded,
                  badge: '24/6 Support',
                  title: '24/6 Customer Support',
                  description:
                      'Get help with spare-parts enquiries, compatibility and support.',
                  accentColor: const Color(0xFF0284C7),
                  onTap: onSupportTap,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildServiceCard(
                  icon: Icons.inventory_2_rounded,
                  badge: 'Free Shipping',
                  title: 'Free Shipping Above ₹999',
                  description:
                      'Enjoy free shipping on eligible orders above ₹999.',
                  accentColor: const Color(0xFFEA580C),
                  onTap: onDeliveryTap,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String badge,
    required String title,
    required String description,
    required Color accentColor,
    required VoidCallback onTap,
  }) {
    return AnimatedHoverCard(
      onTap: onTap,
      liftOffset: -6,
      scaleMultiplier: 1.02,
      glowColor: accentColor,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: kcBorderLight, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: accentColor, size: 24),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      badge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: kcTextDark,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                color: kcTextSecondary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
