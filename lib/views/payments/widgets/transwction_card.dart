import 'package:fitiq/views/payments/models/payment_transaction.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final PaymentTransaction tx;
  final double sw, sh;

  const TransactionCard({required this.tx, required this.sw, required this.sh});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sw * 0.035),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(sw * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Thumbnail ────────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(sw * 0.025),
            child: tx.imageUrl != null
                ? Image.network(
                    tx.imageUrl!,
                    width: sw * 0.14,
                    height: sw * 0.14,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _placeholderThumb(sw),
                  )
                : _placeholderThumb(sw),
          ),

          SizedBox(width: sw * 0.03),

          // ── Info ──────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        tx.programName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: sw * 0.035,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1A1A2E),
                        ),
                      ),
                    ),
                    SizedBox(width: sw * 0.02),
                    _StatusBadge(status: tx.status, sw: sw),
                  ],
                ),
                SizedBox(height: sh * 0.005),
                Text(
                  tx.date,
                  style: TextStyle(
                    fontSize: sw * 0.028,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(height: sh * 0.004),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tx.method,
                      style: TextStyle(
                        fontSize: sw * 0.028,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      tx.amount,
                      style: TextStyle(
                        fontSize: sw * 0.038,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1A1A2E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholderThumb(double sw) {
    return Container(
      width: sw * 0.14,
      height: sw * 0.14,
      color: Colors.grey.shade200,
      child: Icon(
        Icons.image_outlined,
        color: Colors.grey.shade400,
        size: sw * 0.06,
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final PaymentStatus status;
  final double sw;

  const _StatusBadge({required this.status, required this.sw});

  @override
  Widget build(BuildContext context) {
    final config = switch (status) {
      PaymentStatus.success => (
        label: 'Success',
        bg: const Color(0xFFE8F5E9),
        fg: const Color(0xFF2E7D32),
      ),
      PaymentStatus.failed => (
        label: 'Failed',
        bg: const Color(0xFFFCE4EC),
        fg: const Color(0xFFC62828),
      ),
      PaymentStatus.pending => (
        label: 'Pending',
        bg: const Color(0xFFFFF8E1),
        fg: const Color(0xFFF57F17),
      ),
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sw * 0.022,
        vertical: sw * 0.008,
      ),
      decoration: BoxDecoration(
        color: config.bg,
        borderRadius: BorderRadius.circular(sw * 0.05),
      ),
      child: Text(
        config.label,
        style: TextStyle(
          fontSize: sw * 0.028,
          fontWeight: FontWeight.w600,
          color: config.fg,
        ),
      ),
    );
  }
}
