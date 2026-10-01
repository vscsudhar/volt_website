import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/models/category.dart';
import 'package:spare_website/services/parts_catalog_service.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/animated_hover_card.dart';

class CategoriesSection extends StatefulWidget {
  final Function(String categoryName) onCategoryEnquire;

  const CategoriesSection({
    super.key,
    required this.onCategoryEnquire,
  });

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  PartType? _selectedTab; // null for All

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    const evCats = PartsCatalogService.evCategories;
    const petrolCats = PartsCatalogService.petrolCategories;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Eyebrow and Section Heading
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: kcPrimaryLight,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'DISCOVER SPARES',
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
                      'Spare Parts for Your Two-Wheeler',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.w800,
                        color: kcTextDark,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Explore our comprehensive catalogue of genuine 3D visualised spare parts engineered for electric and petrol two-wheelers.',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: isMobile ? 13 : 15,
                        color: kcTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          verticalSpaceLarge,

          // Category Filter Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterTab('All Spare Parts (26)', null),
                const SizedBox(width: 8),
                _buildFilterTab(
                    '⚡ EV Spare Parts (13 Categories)', PartType.ev),
                const SizedBox(width: 8),
                _buildFilterTab(
                    '🏍️ Petrol Bike / Scooter Parts (13 Categories)',
                    PartType.petrol),
              ],
            ),
          ),

          verticalSpaceLarge,

          // EV Spare Parts Group
          if (_selectedTab == null || _selectedTab == PartType.ev) ...[
            _buildCategoryGroupHeader(
              title: 'EV Spare Parts',
              subtitle:
                  'Precision engineered for Ola, Ather, Vida, Chetak and other modern electric scooters',
              icon: Icons.bolt_rounded,
              color: kcPrimaryColor,
            ),
            verticalSpaceMedium,
            _buildCategoryGrid(evCats),
            verticalSpaceLarge,
          ],

          // Petrol Bike / Scooter Parts Group
          if (_selectedTab == null || _selectedTab == PartType.petrol) ...[
            _buildCategoryGroupHeader(
              title: 'Petrol Bike / Scooter Parts',
              subtitle:
                  'High durability maintenance & replacement spares for Hero, Honda, Bajaj, TVS, Yamaha, Royal Enfield',
              icon: Icons.two_wheeler_rounded,
              color: const Color(0xFF0284C7),
            ),
            verticalSpaceMedium,
            _buildCategoryGrid(petrolCats),
          ],
        ],
      ),
    );
  }

  Widget _buildFilterTab(String label, PartType? tabType) {
    final isSelected = _selectedTab == tabType;

    return InkWell(
      onTap: () => setState(() => _selectedTab = tabType),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? kcPrimaryDark : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? kcPrimaryDark : kcBorderLight,
            width: 1.2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: kcPrimaryDark.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : kcTextDark,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryGroupHeader({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: kcTextDark,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  color: kcTextSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryGrid(List<SpareCategory> categories) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 4;
        if (constraints.maxWidth < 600) {
          crossAxisCount = 1;
        } else if (constraints.maxWidth < 950) {
          crossAxisCount = 2;
        } else if (constraints.maxWidth < 1250) {
          crossAxisCount = 3;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 295,
          ),
          itemBuilder: (context, index) {
            final cat = categories[index];
            return _buildCategoryCard(cat);
          },
        );
      },
    );
  }

  Widget _buildCategoryCard(SpareCategory category) {
    final isEv = category.type == PartType.ev;
    final accentColor = isEv ? kcPrimaryColor : const Color(0xFF0284C7);

    return AnimatedHoverCard(
      liftOffset: -4,
      scaleMultiplier: 1.015,
      glowColor: accentColor,
      borderRadius: BorderRadius.circular(18),
      onTap: () => widget.onCategoryEnquire(category.name),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: kcBorderLight),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 3D Product Image Container
            Container(
              height: 125,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kcSurfaceLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kcBorderLight.withValues(alpha: 0.6)),
              ),
              child: Stack(
                children: [
                  if (category.image != null)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          category.image!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            category.icon,
                            color: accentColor,
                            size: 38,
                          ),
                        ),
                      ),
                    )
                  else
                    Center(
                      child: Icon(
                        category.icon,
                        color: accentColor,
                        size: 38,
                      ),
                    ),
                  // Badge Tag at Top Right
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                        color: (isEv ? kcBadgeEvBg : kcBadgePetrolBg)
                            .withValues(alpha: 0.95),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: (isEv ? kcBadgeEvText : kcBadgePetrolText)
                              .withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        isEv ? '⚡ EV' : '🏍️ Petrol',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w700,
                          color: isEv ? kcBadgeEvText : kcBadgePetrolText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Category Name
            Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: kcTextDark,
              ),
            ),

            const SizedBox(height: 3),

            // Description
            Text(
              category.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11.5,
                color: kcTextSecondary,
                height: 1.35,
              ),
            ),

            const Spacer(),

            // Enquire / Ask about this part Link
            InkWell(
              onTap: () => widget.onCategoryEnquire(category.name),
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enquire Availability',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: accentColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward_rounded,
                        size: 14, color: accentColor),
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
