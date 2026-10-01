import 'package:flutter/material.dart';

class VoltSpareLogo extends StatelessWidget {
  final double height;
  final bool isDarkBackground;
  final bool iconOnly;

  const VoltSpareLogo({
    super.key,
    this.height = 42,
    this.isDarkBackground = false,
    this.iconOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final assetPath = iconOnly
        ? 'assets/images/logo_icon.png'
        : 'assets/images/logo_full.png';

    Widget imageWidget = Image.asset(
      assetPath,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        // Fallback icon if asset fails
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF059669),
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  const Icon(Icons.bolt_rounded, color: Colors.white, size: 20),
            ),
            if (!iconOnly) ...[
              const SizedBox(width: 8),
              Text(
                'VoltSpare',
                style: TextStyle(
                  fontSize: height * 0.5,
                  fontWeight: FontWeight.w900,
                  color:
                      isDarkBackground ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
            ],
          ],
        );
      },
    );

    // On dark backgrounds (like hero or footer), add a subtle background pill or filter if full logo is dark text
    if (isDarkBackground && !iconOnly) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
