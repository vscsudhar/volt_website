import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/animated_hover_card.dart';

class SupportSection extends StatelessWidget {
  final VoidCallback onContactSupport;

  const SupportSection({
    super.key,
    required this.onContactSupport,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Heading
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: kcPrimaryLight,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'CUSTOMER CARE & ASSISTANCE',
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
            'Need Help Finding the Right Part?',
            style: GoogleFonts.plusJakartaSans(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.w800,
              color: kcTextDark,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Our support team can help with spare-part enquiries, vehicle compatibility and availability.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: isMobile ? 13 : 15,
              color: kcTextSecondary,
            ),
          ),

          verticalSpaceLarge,

          // 3 Contact Channels Cards (Auto-height responsive layout)
          LayoutBuilder(
            builder: (context, constraints) {
              final isStacked = constraints.maxWidth < 840;

              if (isStacked) {
                return Column(
                  children: [
                    _buildContactCard(
                      icon: Icons.phone_in_talk_rounded,
                      title: 'Call Support',
                      highlight: '+91 98421 24312',
                      timing: '24 Hours • Monday to Saturday',
                      accentColor: kcPrimaryColor,
                      onTap: onContactSupport,
                    ),
                    const SizedBox(height: 14),
                    _buildContactCard(
                      icon: Icons.chat_rounded,
                      title: 'WhatsApp Assistance',
                      highlight: '+91 98421 24312',
                      timing: 'Send photo or part name for instant check',
                      accentColor: const Color(0xFF059669),
                      onTap: onContactSupport,
                    ),
                    const SizedBox(height: 14),
                    _buildContactCard(
                      icon: Icons.email_outlined,
                      title: 'Email Enquiry',
                      highlight: 'support@voltspare.com',
                      timing: 'Detailed workshop & part enquiries',
                      accentColor: const Color(0xFF0284C7),
                      onTap: onContactSupport,
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildContactCard(
                      icon: Icons.phone_in_talk_rounded,
                      title: 'Call Support',
                      highlight: '+91 98421 24312',
                      timing: '24 Hours • Monday to Saturday',
                      accentColor: kcPrimaryColor,
                      onTap: onContactSupport,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildContactCard(
                      icon: Icons.chat_rounded,
                      title: 'WhatsApp Assistance',
                      highlight: '+91 98421 24312',
                      timing: 'Send photo or part name for instant check',
                      accentColor: const Color(0xFF059669),
                      onTap: onContactSupport,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildContactCard(
                      icon: Icons.email_outlined,
                      title: 'Email Enquiry',
                      highlight: 'support@voltspare.com',
                      timing: 'Detailed workshop & part enquiries',
                      accentColor: const Color(0xFF0284C7),
                      onTap: onContactSupport,
                    ),
                  ),
                ],
              );
            },
          ),

          verticalSpaceLarge,

          // 24/6 Support Assurance Banner
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: kcDarkSlate,
              borderRadius: BorderRadius.circular(20),
            ),
            child: LayoutBuilder(
              builder: (context, bannerConstraints) {
                final isNarrow = bannerConstraints.maxWidth < 620;

                if (isNarrow) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: kcPrimaryDark,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.schedule_rounded,
                                color: kcPrimaryElectric, size: 22),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              '24/6 Dedicated Support',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Our automotive technicians are on standby 24 hours a day, 6 days a week to ensure your repair never gets stalled.',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          color: const Color(0xFFCBD5E1),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: onContactSupport,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kcPrimaryAccent,
                            foregroundColor: const Color(0xFF042F2C),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text(
                            'Contact Support',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kcPrimaryDark,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.schedule_rounded,
                          color: kcPrimaryElectric, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '24/6 Dedicated Support Availability',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Our automotive technicians are on standby 24 hours a day, 6 days a week to ensure your repair never gets stalled.',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              color: const Color(0xFFCBD5E1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: onContactSupport,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kcPrimaryAccent,
                        foregroundColor: const Color(0xFF042F2C),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                      ),
                      child: Text(
                        'Contact Support',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String highlight,
    required String timing,
    required Color accentColor,
    required VoidCallback onTap,
  }) {
    return AnimatedHoverCard(
      onTap: onTap,
      liftOffset: -5,
      scaleMultiplier: 1.02,
      glowColor: accentColor,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kcSurfaceLight,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: kcBorderLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: accentColor, size: 22),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: kcTextDark,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              highlight,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: kcPrimaryDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              timing,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                color: kcTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
