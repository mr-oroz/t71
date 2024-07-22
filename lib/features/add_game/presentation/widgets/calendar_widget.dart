// ignore_for_file: deprecated_member_use

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';

class CalendarWidget extends HookConsumerWidget {
  const CalendarWidget({
    super.key,
    required this.controller,
    required this.focusedDay,
    required this.onMonthChanged,
    required this.onDateChange,
  });

  final EasyInfiniteDateTimelineController controller;
  final DateTime focusedDay;
  final Function(DateTime month) onMonthChanged;
  final Function(DateTime selected) onDateChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focused = useState<DateTime>(focusedDay);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.jumpToDate(focused.value);
      });
    }, [focused.value]);

    void _onMonthChanged(DateTime month) {
      onMonthChanged(month);
      focused.value = month;
    }

    void _onDateChange(DateTime selected) {
      onDateChange(selected);
      focused.value = selected;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HorizontalMonthPicker(
            onMonthChanged: _onMonthChanged,
          ),
          const SizedBox(height: 16),
          EasyInfiniteDateTimeLine(
            showTimelineHeader: false,
            controller: controller,
            onDateChange: (value) => _onDateChange(value),
            dayProps: EasyDayProps(
              todayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.blue2,
                ),
              ),
              borderColor: AppColors.white,
              dayStructure: DayStructure.dayStrDayNum,
              inactiveDayStrStyle: AppFonts.w400f13,
              inactiveDayNumStyle: AppFonts.w400f16,
              activeDayDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              )),
              activeDayStyle: DayStyle(
                monthStrStyle: AppFonts.w400f20.copyWith(
                  color: AppColors.white,
                ),
                dayNumStyle: AppFonts.w400f20.copyWith(
                  color: AppColors.white,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: AppColors.blue,
                ),
              ),
            ),
            firstDate: DateTime(2024),
            focusDate: focused.value,
            lastDate: DateTime(2033, 12, 31),
          )
        ],
      ),
    );
  }
}

class HorizontalMonthPicker extends StatefulWidget {
  final Function(DateTime month) onMonthChanged;

  const HorizontalMonthPicker({
    super.key,
    required this.onMonthChanged,
  });

  @override
  State<HorizontalMonthPicker> createState() => _HorizontalMonthPickerState();
}

class _HorizontalMonthPickerState extends State<HorizontalMonthPicker> {
  final ScrollController _scrollController = ScrollController();
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    "August",
    "September",
    'October',
    'November',
    'December',
  ];

  int _selectedMonthIndex = DateTime.now().month - 1;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      double itemWidth = 100.0;
      double screenWidth = MediaQuery.of(context).size.width;
      if (_scrollController.hasClients) {
        double offset = _selectedMonthIndex * itemWidth;
        double centeredOffset = offset - screenWidth / 2 + itemWidth / 2;
        _scrollController.animateTo(
          centeredOffset.clamp(0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: months.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(
                () {
                  _selectedMonthIndex = index;
                  widget.onMonthChanged(
                    DateTime(DateTime.now().year, index + 1),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _selectedMonthIndex == index
                    ? AppColors.blue2
                    : AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Text(
                months[index],
                style: AppFonts.w400f13,
              ),
            ),
          );
        },
      ),
    );
  }
}
