import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../app/theme/colors.dart';
import '../../app/theme/dimensions.dart';
import '../constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool isSmall;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.icon,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonHeight =
        isSmall ? AppDimensions.buttonHeightSm : AppDimensions.buttonHeight;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? buttonHeight,
      child: isOutlined
          ? OutlinedButton(
              onPressed: isLoading ? null : onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: backgroundColor ?? AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                ),
              ),
              child: _buildButtonContent(theme, textColor ?? AppColors.primary),
            )
          : ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? AppColors.primary,
                foregroundColor: textColor ?? Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                ),
              ),
              child: _buildButtonContent(theme, textColor ?? Colors.white),
            ),
    )
        .animate()
        .scale(
          duration: AppConstants.animationDurationFast,
          curve: Curves.easeInOut,
        )
        .then()
        .shimmer(
          duration: AppConstants.animationDurationSlow,
          color: Colors.white.withValues(alpha: 0.1),
        );
  }

  Widget _buildButtonContent(ThemeData theme, Color contentColor) {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(contentColor),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: contentColor, size: 20),
          const SizedBox(width: AppDimensions.sm),
          Flexible(
            child: Text(
              text,
              style: theme.textTheme.labelLarge?.copyWith(color: contentColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: theme.textTheme.labelLarge?.copyWith(color: contentColor),
    );
  }
}
