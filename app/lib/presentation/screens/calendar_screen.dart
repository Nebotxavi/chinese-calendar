import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:feng_shui_calendar/core/constants/app_colors.dart';
import 'package:feng_shui_calendar/core/constants/app_fonts.dart';
import 'package:feng_shui_calendar/core/utils/date_utils.dart';
import 'package:feng_shui_calendar/domain/calendar_day.dart';
import 'package:feng_shui_calendar/presentation/providers/calendar_providers.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarDayAsync = ref.watch(calendarDayProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Expanded(
                child: calendarDayAsync.when(
                  data: (day) => _buildCalendarCard(context, ref, day),
                  loading: () => _buildLoading(),
                  error: (error, stack) => _buildError(error),
                ),
              ),
              const SizedBox(height: 12),
              _buildAdPlaceholder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarCard(
    BuildContext context,
    WidgetRef ref,
    CalendarDay day,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.goldLight),
        boxShadow: const [
          BoxShadow(
            color: Color(0x2E000000),
            blurRadius: 24,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Gold top accent bar
          Container(
            height: 3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              gradient: LinearGradient(
                colors: [Colors.transparent, AppColors.gold, Colors.transparent],
              ),
            ),
          ),
          _buildDateHeader(day),
          // Scrollable content area
          Expanded(
            child: SingleChildScrollView(
              child: _buildContentSection(day),
            ),
          ),
          _buildNavigation(ref, day),
        ],
      ),
    );
  }

  Widget _buildDateHeader(CalendarDay day) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: year + horse motif
          SizedBox(
            width: 72,
            child: Column(
              children: [
                Text(
                  '${day.year}',
                  style: const TextStyle(
                    fontFamily: AppFonts.cormorantGaramond,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.goldRich,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/images/horse.jpg',
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          // Center: day number
          Expanded(
            child: Text(
              '${day.day}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: AppFonts.notoSerifSC,
                fontWeight: FontWeight.w900,
                fontSize: 90,
                height: 0.85,
                color: AppColors.cinnabar,
              ),
            ),
          ),
          // Right: month + monthly motif
          SizedBox(
            width: 72,
            child: Column(
              children: [
                Text(
                  day.monthLabelEs,
                  style: const TextStyle(
                    fontFamily: AppFonts.cormorantGaramond,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.goldRich,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Opacity(
                  opacity: 0.25,
                  child: Image.asset(
                    _monthImagePath(day.month),
                    width: 54,
                    height: 54,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(CalendarDay day) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderGold, width: 1.5),
              borderRadius: BorderRadius.circular(6),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x59FFFFFF), Colors.transparent],
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Day of week
                Text(
                  day.weekdayEs,
                  style: const TextStyle(
                    fontFamily: AppFonts.cormorantGaramond,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.ink,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                // Lunar date
                Text(
                  day.lunarDateDisplay,
                  style: const TextStyle(
                    fontFamily: AppFonts.notoSerifSC,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.ink,
                    letterSpacing: 1.4,
                  ),
                ),
                // Solar term (conditional)
                if (day.hasSolarTerm) ...[
                  const SizedBox(height: 6),
                  Text(
                    day.solarTermZh,
                    style: const TextStyle(
                      fontFamily: AppFonts.maShanZheng,
                      fontSize: 26,
                      color: AppColors.cinnabar,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${day.solarTermEs} · Día ${day.solarTermDayCount}',
                    style: const TextStyle(
                      fontFamily: AppFonts.cormorantGaramond,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: AppColors.inkLight,
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                // Gan/Zhi + element
                Text(
                  '${day.dayGanZhi} · ${day.elementZh} · ${day.elementEs}',
                  style: const TextStyle(
                    fontFamily: AppFonts.notoSansSC,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.goldRich,
                  ),
                ),
                const SizedBox(height: 12),
                // Activities
                _ActivitiesSection(day: day),
                // Proverb
                _buildProverb(day),
              ],
            ),
          ),
          // Corner ornaments
          ..._buildCornerOrnaments(),
        ],
      ),
    );
  }

  List<Widget> _buildCornerOrnaments() {
    return [
      Positioned(
        top: 0,
        left: 0,
        child: _cornerL(top: true, left: true),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: _cornerL(top: true, left: false),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        child: _cornerL(top: false, left: true),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: _cornerL(top: false, left: false),
      ),
    ];
  }

  Widget _cornerL({required bool top, required bool left}) {
    return Opacity(
      opacity: 0.35,
      child: Container(
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          border: Border(
            top: top
                ? const BorderSide(color: AppColors.gold, width: 2)
                : BorderSide.none,
            bottom: !top
                ? const BorderSide(color: AppColors.gold, width: 2)
                : BorderSide.none,
            left: left
                ? const BorderSide(color: AppColors.gold, width: 2)
                : BorderSide.none,
            right: !left
                ? const BorderSide(color: AppColors.gold, width: 2)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildProverb(CalendarDay day) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 4),
      margin: const EdgeInsets.only(top: 14),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.borderGold)),
      ),
      child: Column(
        children: [
          Text(
            day.proverb.chinese,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: AppFonts.maShanZheng,
              fontSize: 16,
              color: AppColors.cinnabar,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            day.proverb.displayTranslation,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: AppFonts.cormorantGaramond,
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: AppColors.inkMedium,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigation(WidgetRef ref, CalendarDay day) {
    final canPrev = canGoPrev(day.date);
    final canNext = canGoNext(day.date);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _navButton(
            '‹',
            enabled: canPrev,
            onTap: () => _navigate(ref, day.date, -1),
          ),
          const SizedBox(width: 12),
          _todayButton(
            onTap: () => ref.read(selectedDateProvider.notifier).state =
                clampDate(DateTime.now()),
          ),
          const SizedBox(width: 12),
          _navButton(
            '›',
            enabled: canNext,
            onTap: () => _navigate(ref, day.date, 1),
          ),
        ],
      ),
    );
  }

  String _monthImagePath(int month) {
    final m = month.toString().padLeft(2, '0');
    return 'assets/images/months/month_$m.jpg';
  }

  void _navigate(WidgetRef ref, DateTime current, int delta) {
    final next = current.add(Duration(days: delta));
    ref.read(selectedDateProvider.notifier).state = clampDate(next);
  }

  Widget _navButton(
    String label, {
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          border: Border.all(
            color: enabled
                ? AppColors.gold
                : AppColors.gold.withValues(alpha: 0.3),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: enabled
                ? AppColors.gold
                : AppColors.gold.withValues(alpha: 0.3),
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _todayButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gold),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Text(
          'Hoy',
          style: TextStyle(
            fontFamily: AppFonts.cormorantGaramond,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.gold,
            letterSpacing: 1.4,
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(color: AppColors.gold),
    );
  }

  Widget _buildError(Object error) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        'Error: $error',
        style: const TextStyle(color: AppColors.cinnabar, fontSize: 14),
      ),
    );
  }

  Widget _buildAdPlaceholder() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.gold.withValues(alpha: 0.25),
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '— Espacio publicitario —',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: AppFonts.inter,
          fontSize: 10,
          color: AppColors.gold.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}

const _maxCollapsedItems = 6;

class _ActivitiesSection extends StatefulWidget {
  final CalendarDay day;

  const _ActivitiesSection({required this.day});

  @override
  State<_ActivitiesSection> createState() => _ActivitiesSectionState();
}

class _ActivitiesSectionState extends State<_ActivitiesSection> {
  bool _expanded = false;

  @override
  void didUpdateWidget(covariant _ActivitiesSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.day.date != widget.day.date) {
      _expanded = false;
    }
  }

  bool get _canExpand =>
      widget.day.auspiciousEs.length > _maxCollapsedItems ||
      widget.day.inauspiciousEs.length > _maxCollapsedItems;

  List<String> _visibleItems(List<String> items) {
    if (_expanded || items.length <= _maxCollapsedItems) {
      return items;
    }
    return items.sublist(0, _maxCollapsedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Auspicious (宜)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '宜',
                      style: TextStyle(
                        fontFamily: AppFonts.zhiMangXing,
                        fontSize: 28,
                        color: AppColors.cinnabar,
                      ),
                    ),
                    const Text(
                      'auspicioso',
                      style: TextStyle(
                        fontFamily: AppFonts.cormorantGaramond,
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                        color: AppColors.inkLight,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _visibleItems(widget.day.auspiciousEs).join(' · '),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: AppFonts.inter,
                        fontSize: 13,
                        color: AppColors.ink,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              // Vertical gold divider
              Container(
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 7),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.gold,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              // Inauspicious (忌)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '忌',
                      style: TextStyle(
                        fontFamily: AppFonts.zhiMangXing,
                        fontSize: 28,
                        color: AppColors.inkLight,
                      ),
                    ),
                    const Text(
                      'no auspicioso',
                      style: TextStyle(
                        fontFamily: AppFonts.cormorantGaramond,
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                        color: AppColors.inkLight,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _visibleItems(widget.day.inauspiciousEs).join(' · '),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: AppFonts.inter,
                        fontSize: 13,
                        color: AppColors.ink,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (_canExpand)
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                _expanded ? '▴' : '▾',
                style: const TextStyle(
                  fontSize: 26,
                  color: AppColors.gold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
