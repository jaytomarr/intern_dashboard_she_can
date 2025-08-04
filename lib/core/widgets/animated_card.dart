import 'package:flutter/material.dart';
import '../../app/theme/colors.dart';
import '../../app/theme/dimensions.dart';

class AnimatedCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double? elevation;
  final VoidCallback? onTap;
  final bool enableHover;

  const AnimatedCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation,
    this.onTap,
    this.enableHover = true,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _elevationAnimation = Tween<double>(
      begin: widget.elevation ?? AppDimensions.cardElevation,
      end: AppDimensions.cardElevationHover,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    if (!widget.enableHover) return;

    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            margin: widget.margin ?? const EdgeInsets.all(AppDimensions.md),
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
              boxShadow: [
                BoxShadow(
                  color: AppColors.onSurface.withValues(alpha: 0.1),
                  blurRadius: _elevationAnimation.value * 2,
                  offset: Offset(0, _elevationAnimation.value),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onTap,
                onHover: _onHover,
                borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                child: Container(
                  padding:
                      widget.padding ?? const EdgeInsets.all(AppDimensions.lg),
                  child: widget.child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GradientCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final List<Color>? gradientColors;
  final VoidCallback? onTap;

  const GradientCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.gradientColors,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(AppDimensions.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        gradient: LinearGradient(
          colors:
              gradientColors ??
              [
                        AppColors.primary.withValues(alpha: 0.1),
        AppColors.primaryLight.withValues(alpha: 0.05),
              ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          child: Container(
            padding: padding ?? const EdgeInsets.all(AppDimensions.lg),
            child: child,
          ),
        ),
      ),
    );
  }
}
