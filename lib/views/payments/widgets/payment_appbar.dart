import 'package:flutter/material.dart';

class PaymentAppBar extends StatelessWidget {
  final double sw, sh;
  const PaymentAppBar({required this.sw, required this.sh});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sw * 0.04,
        vertical: sh * 0.014,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: Container(
              width: sw * 0.09,
              height: sw * 0.09,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(sw * 0.025),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Icon(
                Icons.chevron_left_rounded,
                size: sw * 0.055,
                color: const Color(0xFF1A1A2E),
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Payment History',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sw * 0.048,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF2E3192),
              ),
            ),
          ),
          // Placeholder to balance the row
          SizedBox(width: sw * 0.09),
        ],
      ),
    );
  }
}
