import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/animated_hover_card.dart';
import 'package:spare_website/ui/widgets/volt_spare_logo.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onExploreParts;
  final VoidCallback onContactSupport;

  const HeroSection({
    super.key,
    required this.onExploreParts,
    required this.onContactSupport,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kcDarkSlate,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0B1320),
            Color(0xFF062D22),
            Color(0xFF064E3B),
            Color(0xFF0B1320),
          ],
          stops: [0.0, 0.45, 0.8, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Ambient Glow Background Circles
          Positioned(
            top: -120,
            right: -120,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    kcPrimaryAccent.withValues(alpha: 0.18),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    kcSecondaryColor.withValues(alpha: 0.14),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: hPadding,
              vertical: isMobile ? 36 : (isDesktop ? 68 : 50),
            ),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left Column: Headline, Supporting Text, CTAs
                      Expanded(
                        flex: 6,
                        child: _buildHeroContent(context, isMobile: false),
                      ),
                      horizontalSpaceExtraLarge,
                      // Right Column: Automotive Visual Graphics Card
                      Expanded(
                        flex: 5,
                        child: _buildAutomotiveVisualCard(context),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildHeroContent(context, isMobile: true),
                      verticalSpaceLarge,
                      _buildAutomotiveVisualCard(context),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Tagline Pill with Pulsing Glow Animation
        PulsingGlowBadge(
          glowColor: kcPrimaryElectric,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A).withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: kcPrimaryAccent.withValues(alpha: 0.6),
                width: 1.2,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const VoltSpareLogo(height: 18, iconOnly: true),
                const SizedBox(width: 8),
                Text(
                  'INDIA\'S DEDICATED EV + PETROL SPARES PLATFORM',
                  style: GoogleFonts.plusJakartaSans(
                    color: kcPrimaryElectric,
                    fontSize: isMobile ? 10 : 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ),

        verticalSpaceMedium,

        // Main Heading
        Text(
          'Quality Spare Parts.\nFor Every Ride.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: isMobile ? 34 : 50,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 1.12,
            letterSpacing: -1.0,
          ),
        ),

        verticalSpaceMedium,

        // Supporting Text
        Text(
          'EV and petrol two-wheeler spare parts with reliable support and fast local delivery.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.plusJakartaSans(
            fontSize: isMobile ? 15 : 18,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFCBD5E1),
            height: 1.5,
          ),
        ),

        verticalSpaceLarge,

        // CTA Buttons
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: onExploreParts,
              style: ElevatedButton.styleFrom(
                backgroundColor: kcPrimaryAccent,
                foregroundColor: const Color(0xFF042F2C),
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Explore Spare Parts',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF042F2C),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_downward_rounded,
                      size: 18, color: Color(0xFF042F2C)),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: onContactSupport,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white60, width: 1.5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.headset_mic_rounded,
                      size: 18, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    'Contact Support',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAutomotiveVisualCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.15),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Badge Row
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: kcPrimaryDark,
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: kcPrimaryAccent.withValues(alpha: 0.5)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.two_wheeler_rounded,
                        color: kcPrimaryElectric, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      'DUAL MOBILITY COVERAGE',
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '25+ CATEGORIES',
                  style: GoogleFonts.plusJakartaSans(
                    color: kcPrimaryElectric,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          verticalSpaceMedium,

          // 4 Visual Feature Panels
          Row(
            children: [
              Expanded(
                child: _buildShowcaseTile(
                  icon: Icons.electric_scooter_rounded,
                  title: 'EV Spare Parts',
                  subtitle: 'Ola • Ather • Vida • Chetak',
                  color: const Color(0xFF10B981),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: _buildShowcaseTile(
                  icon: Icons.motorcycle_rounded,
                  title: 'Petrol Bike Spares',
                  subtitle: 'Hero • Honda • Bajaj • TVS',
                  color: const Color(0xFF0284C7),
                ),
              ),
            ],
          ),
          verticalSpaceSmall,
          Row(
            children: [
              Expanded(
                child: _buildShowcaseTile(
                  icon: Icons.disc_full_rounded,
                  title: 'Brakes & Cables',
                  subtitle: 'Shoes • Pads • Dura-Wires',
                  color: const Color(0xFF0D9488),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: _buildShowcaseTile(
                  icon: Icons.water_drop_rounded,
                  title: 'Oils & Filters',
                  subtitle: 'Synthetic 4T • Air Filters',
                  color: const Color(0xFFEA580C),
                ),
              ),
            ],
          ),

          verticalSpaceMedium,

          // Bottom Trust Row with Wrap safety
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 6,
              children: [
                _buildMiniBadge(Icons.verified_rounded, '100% Genuine Spec'),
                _buildMiniBadge(Icons.flash_on_rounded, 'Same-Day Dispatch'),
                _buildMiniBadge(Icons.support_agent_rounded, '24/6 Support'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShowcaseTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return AnimatedHoverCard(
      liftOffset: -3,
      scaleMultiplier: 1.02,
      glowColor: color,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withValues(alpha: 0.35)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color(0xFF94A3B8),
                      fontSize: 10,
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

  Widget _buildMiniBadge(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: kcPrimaryElectric),
        const SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white70,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
