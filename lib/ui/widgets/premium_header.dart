import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spare_website/ui/common/app_colors.dart';
import 'package:spare_website/ui/common/ui_helpers.dart';
import 'package:spare_website/ui/widgets/volt_spare_logo.dart';

class PremiumHeader extends StatelessWidget implements PreferredSizeWidget {
  final Function(String section) onNavigate;

  const PremiumHeader({
    super.key,
    required this.onNavigate,
  });

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    final hPadding = ResponsiveBreakpoints.getHorizontalPadding(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        border:
            const Border(bottom: BorderSide(color: kcBorderLight, width: 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 12),
          child: Row(
            children: [
              // Mobile Hamburger
              if (!isDesktop) ...[
                IconButton(
                  icon: const Icon(Icons.menu_rounded,
                      color: kcTextDark, size: 26),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  tooltip: 'Menu',
                ),
                const SizedBox(width: 4),
              ],

              // VoltSpare Logo
              _buildBrandLogo(context),

              if (isDesktop) ...[
                const SizedBox(width: 24),
                // Desktop Navigation Links with horizontal overflow safety
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildNavLink('Home', () => onNavigate('home')),
                        _buildNavLink(
                            'Categories', () => onNavigate('categories')),
                        _buildNavLink('EV Parts', () => onNavigate('ev-parts')),
                        _buildNavLink(
                            'Petrol Parts', () => onNavigate('petrol-parts')),
                        _buildNavLink('Support', () => onNavigate('support')),
                        _buildNavLink('About', () => onNavigate('about')),
                        _buildNavLink('Contact', () => onNavigate('contact')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ] else
                const Spacer(),

              // Support / Enquiry CTA Button
              ElevatedButton.icon(
                onPressed: () => onNavigate('contact'),
                icon: const Icon(Icons.headset_mic_rounded,
                    size: 16, color: Colors.white),
                label: Text(
                  isDesktop ? 'Enquire Spare Parts' : 'Enquire',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kcPrimaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 18 : 12,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandLogo(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.isDesktop(context);
    return InkWell(
      onTap: () => onNavigate('home'),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: VoltSpareLogo(
          height: isDesktop ? 44 : 36,
        ),
      ),
    );
  }

  Widget _buildNavLink(String title, VoidCallback onTap) {
    return _HeaderNavLink(title: title, onTap: onTap);
  }
}

class _HeaderNavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _HeaderNavLink({required this.title, required this.onTap});

  @override
  State<_HeaderNavLink> createState() => _HeaderNavLinkState();
}

class _HeaderNavLinkState extends State<_HeaderNavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: _isHovered ? kcPrimaryLight : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              fontWeight: _isHovered ? FontWeight.w800 : FontWeight.w600,
              color: _isHovered ? kcPrimaryDark : kcTextDark,
            ),
          ),
        ),
      ),
    );
  }
}
