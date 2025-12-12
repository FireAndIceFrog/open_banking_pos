String formatAmount(String raw) {
  // Keep digits only, then format to 2 decimal places
  final digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
  if (digits.isEmpty) return '0.00';
  final value = int.parse(digits);
  final dollars = (value / 100).toStringAsFixed(2);
  return dollars;
}