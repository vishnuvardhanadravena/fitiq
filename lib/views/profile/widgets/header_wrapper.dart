// ─────────────────────────────────────────────
// PROFILE HEADER WRAPPER  —  fully dynamic sizing
// All heights & widths derived from MediaQuery
// ─────────────────────────────────────────────

import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/widgets/blue_container_wraper.dart';
import 'package:fitiq/core/widgets/circle_icon_btn.dart';
import 'package:fitiq/views/profile/widgets/edit_profile_btn.dart';
import 'package:fitiq/views/profile/widgets/statds_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitiq/views/profile/models/profile_header_data.dart';

class ProfileHeaderWrapper extends StatelessWidget {
  final ProfileHeaderData data;
  final Widget? avatarWidget;
  final Widget? titleWidget;
  final Widget? subtitleWidget;
  final Widget? editButtonWidget;
  final Widget? statsWidget;
  final Widget? bottomWidget;
  final Widget? body;
  final VoidCallback? onBack;
  final VoidCallback? onEditProfile;
  final VoidCallback? onAvatarTap;
  final void Function(int, ProfileStat)? onStatTap;
  final bool showBackButton;
  final Widget? trailingAction;
  final Color? statsCardColor;
  final double statsCardElevation;
  final double statsCardBorderRadius;
  final BorderSide avatarBorderSide;
  final bool showStatusBar;

  const ProfileHeaderWrapper({
    super.key,
    required this.data,
    this.avatarWidget,
    this.titleWidget,
    this.subtitleWidget,
    this.editButtonWidget,
    this.statsWidget,
    this.bottomWidget,
    this.body,
    this.onBack,
    this.onEditProfile,
    this.onAvatarTap,
    this.onStatTap,
    this.showBackButton = true,
    this.trailingAction,
    this.statsCardColor,
    this.statsCardElevation = 4,
    this.statsCardBorderRadius = 20,
    this.avatarBorderSide = const BorderSide(color: Colors.white, width: 3),
    this.showStatusBar = true,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = statsCardColor ?? Theme.of(context).colorScheme.surface;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: showStatusBar
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.42,
                child: _HeaderSection(
                  data: data,
                  avatarWidget: avatarWidget,
                  titleWidget: titleWidget,
                  subtitleWidget: subtitleWidget,
                  editButtonWidget: editButtonWidget,
                  statsWidget: statsWidget,
                  bottomWidget: bottomWidget,
                  onBack: onBack,
                  onEditProfile: onEditProfile,
                  onAvatarTap: onAvatarTap,
                  onStatTap: onStatTap,
                  showBackButton: showBackButton,
                  trailingAction: trailingAction,
                  avatarBorderSide: avatarBorderSide,
                  cardColor: cardColor,
                  cardElevation: statsCardElevation,
                  cardBorderRadius: statsCardBorderRadius,
                ),
              ),
            ),
            if (body != null)
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                sliver: SliverToBoxAdapter(child: body),
              ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final ProfileHeaderData data;
  final Widget? avatarWidget,
      titleWidget,
      subtitleWidget,
      editButtonWidget,
      statsWidget,
      bottomWidget,
      trailingAction;
  final VoidCallback? onBack, onEditProfile, onAvatarTap;
  final void Function(int, ProfileStat)? onStatTap;
  final bool showBackButton;
  final BorderSide avatarBorderSide;
  final Color cardColor;
  final double cardElevation, cardBorderRadius;

  const _HeaderSection({
    required this.data,
    this.avatarWidget,
    this.titleWidget,
    this.subtitleWidget,
    this.editButtonWidget,
    this.statsWidget,
    this.bottomWidget,
    this.onBack,
    this.onEditProfile,
    this.onAvatarTap,
    this.onStatTap,
    required this.showBackButton,
    this.trailingAction,
    required this.avatarBorderSide,
    required this.cardColor,
    required this.cardElevation,
    required this.cardBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final sw = mq.size.width;
    final sh = mq.size.height;
    final topPad = mq.padding.top;
    final avatarR = sw * 0.11;
    // final cardOffset = avatarR + sh * 0.02;

    return Stack(
      children: [
        Container(
          height: sh * 0.39,
          color: Colors.white,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              BackgroundContainer(
                padding: EdgeInsets.only(right: 16, top: topPad),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                // decoration: BoxDecoration(
                //   borderRadius: const BorderRadius.vertical(
                //     bottom: Radius.circular(32),
                //   ),
                //   gradient: LinearGradient(
                //     colors: data.gradientColors,
                //     begin: data.gradientBegin,
                //     end: data.gradientEnd,
                //   ),
                // ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: sw * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (showBackButton)
                            CircleIconButton(
                              icon: Icons.chevron_left_rounded,
                              size: sw * 0.095,
                              onTap:
                                  onBack ?? () => Navigator.maybePop(context),
                            )
                          else
                            SizedBox(width: sw * 0.1),
                          if (trailingAction != null) trailingAction!,
                        ],
                      ),
                    ),

                    SizedBox(height: sh * 0.006),

                    GestureDetector(
                      onTap: onAvatarTap,
                      child:
                          avatarWidget ??
                          DefaultAvatar(
                            data: data,
                            radius: avatarR,
                            borderSide: avatarBorderSide,
                          ),
                    ),

                    SizedBox(height: sh * 0.006),

                    // ── Name ─────────────────────────────
                    titleWidget ??
                        Text(
                          data.name,
                          style: AppTextStyles.headingMedium.copyWith(
                            // TextStyle(
                            color: Colors.white,
                            fontSize: sw * 0.055,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ),

                    SizedBox(height: sh * 0.006),

                    // ── Subtitle ─────────────────────────
                    subtitleWidget ??
                        Text(
                          data.subtitle,
                          style: AppTextStyles.subheading.copyWith(
                            //  TextStyle(
                            color: Colors.white.withValues(alpha: 0.82),
                            fontSize: sw * 0.033,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                    SizedBox(height: sh * 0.006),

                    // ── Edit Button ──────────────────────
                    editButtonWidget ??
                        EditProfileButton(
                          label: data.editButtonLabel,
                          horizontalPad: sw * 0.07,
                          verticalPad: sh * 0.012,
                          fontSize: sw * 0.035,
                          iconSize: sw * 0.04,
                          onTap: onEditProfile,
                        ),

                    if (bottomWidget != null) ...[
                      SizedBox(height: sh * 0.015),
                      bottomWidget!,
                    ],
                  ],
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SizedBox(height: sh * 0.06),
              ),
            ],
          ),
        ),
        Positioned(
          left: sw * 0.04,
          right: sw * 0.04,
          bottom: 0,
          child: Transform.translate(
            offset: Offset(0, sh * 0.035),
            child:
                statsWidget ??
                StatsCard(
                  stats: data.stats,
                  color: cardColor,
                  elevation: cardElevation,
                  borderRadius: cardBorderRadius,
                  onStatTap: onStatTap,
                  whiteText: true,
                ),
          ),
        ),
      ],
    );
  }
}

class DefaultAvatar extends StatelessWidget {
  final ProfileHeaderData data;
  final double radius;
  final BorderSide borderSide;

  const DefaultAvatar({
    super.key,
    required this.data,
    required this.radius,
    required this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "profile",
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.fromBorderSide(borderSide),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.grey.shade300,
          backgroundImage:
              data.avatarImage ??
              (data.avatarUrl != null ? NetworkImage(data.avatarUrl!) : null),
          child: (data.avatarImage == null && data.avatarUrl == null)
              ? Icon(Icons.person, size: radius, color: Colors.grey.shade600)
              : null,
        ),
      ),
    );
  }
}
