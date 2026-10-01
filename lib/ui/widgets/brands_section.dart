import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/models/brand.dart';
import 'package:spare_website/services/parts_catalog_service.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/animated_hover_card.dart';

class BrandsSection extends StatelessWidget {
  final Function(String brandName) onBrandSelect;

  const BrandsSection({
    super.key,
    required this.onBrandSelect,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    const evBrands = PartsCatalogService.evBrands;
    const petrolBrands = PartsCatalogService.petrolBrands;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
      color: kcSurfaceLight,
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
              'MODEL COMPATIBILITY',
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
            'Parts for Popular Two-Wheeler Brands',
            style: GoogleFonts.plusJakartaSans(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.w800,
              color: kcTextDark,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'VoltSpare stocks genuine specification spares across leading electric scooter and petrol motorcycle brands in India.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: isMobile ? 13 : 15,
              color: kcTextSecondary,
            ),
          ),

          verticalSpaceLarge,

          // EV Brands
          Row(
            children: [
              const Icon(Icons.bolt_rounded, color: kcPrimaryColor, size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Electric Two-Wheeler Brands (5 Models)',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: isMobile ? 15 : 18,
                    fontWeight: FontWeight.w800,
                    color: kcTextDark,
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceMedium,
          _buildBrandGrid(evBrands, isEv: true),

          verticalSpaceLarge,

          // Petrol Brands
          Row(
            children: [
              const Icon(Icons.two_wheeler_rounded,
                  color: Color(0xFF0284C7), size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Petrol Motorcycle & Scooter Brands (6 Brands)',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: isMobile ? 15 : 18,
                    fontWeight: FontWeight.w800,
                    color: kcTextDark,
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceMedium,
          _buildBrandGrid(petrolBrands, isEv: false),

          verticalSpaceLarge,

          // Disclaimer Note
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kcBorderLight),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline_rounded,
                    size: 18, color: kcTextMuted),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Note: All vehicle brand names, designations and models are mentioned strictly for spare-part fitment compatibility.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      color: kcTextSecondary,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandGrid(List<SupportedBrand> brands, {required bool isEv}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 5;
        if (constraints.maxWidth < 600) {
          crossAxisCount = 1;
        } else if (constraints.maxWidth < 900) {
          crossAxisCount = 2;
        } else if (constraints.maxWidth < 1200) {
          crossAxisCount = 3;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            mainAxisExtent: 215,
          ),
          itemBuilder: (context, index) {
            final brand = brands[index];
            return _buildBrandCard(brand, isEv);
          },
        );
      },
    );
  }

  Widget _buildBrandCard(SupportedBrand brand, bool isEv) {
    final accentColor = isEv ? kcPrimaryColor : const Color(0xFF0284C7);

    return AnimatedHoverCard(
      liftOffset: -4,
      scaleMultiplier: 1.02,
      glowColor: accentColor,
      borderRadius: BorderRadius.circular(16),
      onTap: () => onBrandSelect(brand.name),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kcBorderLight),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle Visual Image
            Container(
              height: 105,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isEv ? kcBadgeEvBg.withValues(alpha: 0.4) : kcBadgeUniversalBg.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kcBorderLight.withValues(alpha: 0.5)),
              ),
              child: brand.image != null
                  ? Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        brand.image!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Icon(
                            brand.icon,
                            color: accentColor,
                            size: 32,
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Icon(
                        brand.icon,
                        color: accentColor,
                        size: 32,
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    brand.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: kcTextDark,
                    ),
                  ),
                ),
                Icon(Icons.arrow_outward_rounded,
                    size: 13, color: accentColor),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              brand.tagline,
              maxLines: 1,
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
