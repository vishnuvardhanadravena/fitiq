import 'package:fitiq/core/widgets/blue_container_wraper.dart';
import 'package:fitiq/views/payments/models/payment_transaction.dart';
import 'package:fitiq/views/profile/models/profile_header_data.dart';
import 'package:fitiq/views/profile/widgets/statds_widget.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final double sw, sh;
  final PaymentSummary summary;
  const SummaryCard({
    super.key,
    required this.sw,
    required this.sh,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final stats = [
      ProfileStat(value: summary.activeCount.toString(), label: 'Active'),
      ProfileStat(value: summary.completedCount.toString(), label: 'Completed'),
      ProfileStat(value: summary.lastPaidAmount, label: 'Last Paid'),
    ];

    return BackgroundContainer(
      borderRadiusValue: sw * 0.045,
      padding: EdgeInsets.fromLTRB(
        sw * 0.05,
        sh * 0.022,
        sw * 0.05,
        sh * 0.022,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Investment',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: sw * 0.032,
                    ),
                  ),
                  SizedBox(height: sh * 0.004),
                  Text(
                    'Across ${summary.enrolledCount} enrolled programs',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: sw * 0.028,
                    ),
                  ),
                ],
              ),
              Text(
                summary.totalInvestment,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: sw * 0.07,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: sh * 0.022),
          Container(height: 0.5, color: Colors.white.withValues(alpha: 0.2)),
          SizedBox(height: sh * 0.01),
          StatsCard(
            stats: stats,
            color: Colors.transparent,
            elevation: 0,
            borderRadius: 0,
            whiteText: true,
          ),
        ],
      ),
    );
  }
}
