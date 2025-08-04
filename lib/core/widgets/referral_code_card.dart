import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';

class ReferralCodeCard extends StatefulWidget {
  final String referralCode;
  final VoidCallback? onShare;

  const ReferralCodeCard({
    super.key,
    required this.referralCode,
    this.onShare,
  });

  @override
  State<ReferralCodeCard> createState() => _ReferralCodeCardState();
}

class _ReferralCodeCardState extends State<ReferralCodeCard> {
  bool _copied = false;

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.referralCode));
    setState(() {
      _copied = true;
    });

    // Reset copied state after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _copied = false;
        });
      }
    });

    // Show snackbar
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Referral code copied to clipboard!'),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.gift,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Your Referral Code',
                style: AppTypography.h2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                  color: Colors.white.withValues(alpha: 0.3),
                  width: 1,
                ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.referralCode,
                    style: AppTypography.h1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _copyToClipboard,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _copied
                          ? AppColors.success
                          : Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _copied ? LucideIcons.check : LucideIcons.copy,
                      color: _copied ? Colors.white : Colors.white,
                      size: 18,
                    ),
                  ),
                )
                    .animate(target: _copied ? 1 : 0)
                    .scale(
                        begin: const Offset(1, 1), end: const Offset(1.2, 1.2))
                    .then()
                    .scale(
                        begin: const Offset(1.2, 1.2), end: const Offset(1, 1)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Share this code with friends and earn rewards when they make their first donation!',
            style: AppTypography.body1.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          if (widget.onShare != null) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: widget.onShare,
                icon: const Icon(LucideIcons.share2, size: 18),
                label: const Text('Share Code'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 500)).slideY(
        begin: 0.3, end: 0, duration: const Duration(milliseconds: 500));
  }
}
