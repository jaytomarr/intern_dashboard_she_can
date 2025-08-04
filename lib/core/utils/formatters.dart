import 'package:intl/intl.dart';

class Formatters {
  static String formatCurrency(double amount) {
    return NumberFormat.currency(symbol: '₹', decimalDigits: 0).format(amount);
  }

  static String formatCompactNumber(double number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toStringAsFixed(0);
  }

  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('MMM dd, yyyy HH:mm').format(date);
  }

  static String formatRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  static String formatPercentage(double value, double total) {
    final percentage = (value / total) * 100;
    return '${percentage.toStringAsFixed(1)}%';
  }

  static String formatReferralCode(String code) {
    // Add spaces every 4 characters for better readability
    final formatted = code.replaceAllMapped(
      RegExp(r'.{4}'),
      (match) => '${match.group(0)} ',
    );
    return formatted.trim();
  }
}
