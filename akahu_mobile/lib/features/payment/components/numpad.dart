import 'package:flutter/material.dart';
import '../../foundation/app_colors.dart';
import '../../foundation/app_text.dart';

/// Accessible numeric keypad: buttons min 48x48, shared styles.
/// Emits tapped digits and provides backspace and clear.
class Numpad extends StatelessWidget {
  final void Function(String digit) onDigit;
  final VoidCallback onBackspace;
  final VoidCallback onClear;

  const Numpad({
    super.key,
    required this.onDigit,
    required this.onBackspace,
    required this.onClear,
  });

  Widget _key(BuildContext context, {required Widget child, required VoidCallback onTap}) {
    return SizedBox(
      width: 64,
      height: 64,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            minimumSize: const Size(48, 48),
          ),
          onPressed: onTap,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final digits = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['C', '0', '⌫'],
    ];

    return Column(
      children: [
        for (final row in digits)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row.map((d) {
              if (d == 'C') {
                return _key(context, child: Text('C', style: AppText.button), onTap: onClear);
              }
              if (d == '⌫') {
                return _key(context, child: Text('⌫', style: AppText.button), onTap: onBackspace);
              }
              return _key(context, child: Text(d, style: AppText.button), onTap: () => onDigit(d));
            }).toList(),
          ),
      ],
    );
  }
}
