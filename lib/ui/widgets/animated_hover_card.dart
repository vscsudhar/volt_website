import 'package:flutter/material.dart';

/// Interactive hover card that lifts and adds glowing shadow on cursor hover
class AnimatedHoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double liftOffset;
  final double scaleMultiplier;
  final BorderRadius? borderRadius;
  final Color? glowColor;
  final Duration duration;

  const AnimatedHoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.liftOffset = -5.0,
    this.scaleMultiplier = 1.015,
    this.borderRadius,
    this.glowColor,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<AnimatedHoverCard> createState() => _AnimatedHoverCardState();
}

class _AnimatedHoverCardState extends State<AnimatedHoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? BorderRadius.circular(16);

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()
            ..translateByDouble(0.0, _isHovered ? widget.liftOffset : 0.0, 0.0, 1.0)
            ..scaleByDouble(_isHovered ? widget.scaleMultiplier : 1.0, _isHovered ? widget.scaleMultiplier : 1.0, 1.0, 1.0),
          decoration: BoxDecoration(
            borderRadius: radius,
            boxShadow: _isHovered && widget.glowColor != null
                ? [
                    BoxShadow(
                      color: widget.glowColor!.withValues(alpha: 0.25),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Continuous subtle pulsating glow animation for highlight badges
class PulsingGlowBadge extends StatefulWidget {
  final Widget child;
  final Color glowColor;

  const PulsingGlowBadge({
    super.key,
    required this.child,
    this.glowColor = const Color(0xFF10B981),
  });

  @override
  State<PulsingGlowBadge> createState() => _PulsingGlowBadgeState();
}

class _PulsingGlowBadgeState extends State<PulsingGlowBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.2, end: 0.65).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: widget.glowColor.withValues(alpha: _animation.value),
                blurRadius: 12 * _animation.value,
                spreadRadius: 2 * _animation.value,
              ),
            ],
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
