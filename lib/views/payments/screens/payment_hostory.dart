import 'package:fitiq/core/widgets/blue_container_wraper.dart';
import 'package:fitiq/views/payments/provoder/payment_provider.dart';
import 'package:fitiq/views/payments/widgets/payment_appbar.dart';
import 'package:fitiq/views/payments/widgets/summary_shimmer.dart';
import 'package:fitiq/views/payments/widgets/transwction_card.dart';
import 'package:fitiq/views/profile/widgets/statds_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitiq/views/profile/models/profile_header_data.dart';
import 'package:fitiq/views/payments/models/payment_transaction.dart';

class PaymentHistoryScreen extends ConsumerWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context);
    final sw = mq.size.width;
    final sh = mq.size.height;

    final summaryState = ref.watch(paymentSummaryProvider);
    final txState = ref.watch(paymentTransactionsProvider);
    final txs = ref.watch(filteredTransactionsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentAppBar(sw: sw, sh: sh),

            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.wait([
                    ref.read(paymentSummaryProvider.notifier).fetch(),
                    ref.read(paymentTransactionsProvider.notifier).fetch(),
                  ]);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: sw * 0.04,
                    vertical: sh * 0.012,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: sh * 0.018),

                      /// ───────── SUMMARY ─────────
                      if (summaryState.isLoading)
                        const SummaryShimmer()
                      else if (summaryState.error != null)
                        _ErrorWidget(
                          message: summaryState.error!,
                          onRetry: () =>
                              ref.read(paymentSummaryProvider.notifier).retry(),
                        )
                      else if (summaryState.data != null)
                        _SummaryCard(
                          sw: sw,
                          sh: sh,
                          summary: summaryState.data!,
                        )
                      else
                        const SizedBox(), // ✅ FIX (no crash)

                      SizedBox(height: sh * 0.028),

                      /// ───────── TITLE ─────────
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontSize: sw * 0.047,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF2E3192),
                        ),
                      ),

                      SizedBox(height: sh * 0.015),

                      /// ───────── TRANSACTIONS ─────────
                      NotificationListener<ScrollNotification>(
                        onNotification: (scrollInfo) {
                          // if (scrollInfo.metrics.pixels ==
                          //     scrollInfo.metrics.maxScrollExtent) {
                          //   ref
                          //       .read(paymentTransactionsProvider.notifier)
                          //       .loadMore(); // ✅ pagination
                          // }
                          return false;
                        },
                        child: Column(
                          children: [
                            if (txState.isLoading)
                              const TransactionListShimmer()
                            else if (txState.error != null)
                              _ErrorWidget(
                                message: txState.error!,
                                onRetry: () => ref
                                    .read(paymentTransactionsProvider.notifier)
                                    .retry(),
                              )
                            else if (txState.data != null)
                              ...txs.map(
                                (tx) => Padding(
                                  padding: EdgeInsets.only(bottom: sh * 0.014),
                                  child: TransactionCard(
                                    tx: tx,
                                    sw: sw,
                                    sh: sh,
                                  ),
                                ),
                              )
                            else
                              const SizedBox(),

                            /// bottom loader (optional)
                            if (txState.isLoading == false)
                              const Padding(
                                padding: EdgeInsets.all(12),
                                child: SizedBox.shrink(),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final double sw, sh;
  final PaymentSummary summary;
  const _SummaryCard({
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

class _ErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorWidget({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
