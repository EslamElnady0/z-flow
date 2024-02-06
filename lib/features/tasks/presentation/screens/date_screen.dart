import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/tasks/presentation/cubits/cubit/bottom_nav_bar_cubit.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/task_item.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/title_text_widget.dart';

class DateScreen extends StatelessWidget {
  const DateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          TitleTextWidget(
            text: 'تقويم ميلادي!',
            style: Styles.style10,
          ),
          SizedBox(
            height: 30.h,
          ),
          SvgPicture.asset(
            "assets/images/undraw_schedule_meeting_52nu 1.svg",
            width: 262.w,
            height: 191.h,
          ),
          BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
            builder: (context, state) {
              return Container(
                height: 234.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [Constants.shadow]),
                child: TableCalendar(
                  onDaySelected:
                      context.read<BottomNavBarCubit>().onDaySelected,
                  rowHeight: 29.h,
                  selectedDayPredicate: (day) =>
                      isSameDay(day, context.read<BottomNavBarCubit>().today),
                  availableGestures: AvailableGestures.all,
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: Styles.style10,
                      weekendStyle: Styles.style10),
                  calendarStyle: CalendarStyle(
                      selectedTextStyle:
                          Styles.style10.copyWith(color: Colorrs.kWhite),
                      selectedDecoration: const BoxDecoration(
                          color: Colorrs.kCyan, shape: BoxShape.circle),
                      tablePadding: EdgeInsets.zero,
                      markerDecoration:
                          const BoxDecoration(color: Colorrs.kCyan),
                      cellMargin: EdgeInsets.symmetric(vertical: 2.h),
                      cellPadding: EdgeInsets.zero,
                      defaultTextStyle: Styles.style10,
                      todayTextStyle: Styles.style10,
                      holidayTextStyle: Styles.style10,
                      disabledTextStyle: Styles.style10,
                      weekendTextStyle: Styles.style10,
                      outsideTextStyle: Styles.style10,
                      outsideDaysVisible: false),
                  headerStyle: HeaderStyle(
                      headerPadding: EdgeInsets.symmetric(vertical: 4.h),
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: Styles.style16),
                  focusedDay: context.read<BottomNavBarCubit>().today,
                  firstDay: DateTime.utc(2012, 1, 1),
                  lastDay: DateTime.utc(2036, 12, 31),
                ),
              );
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          TitleTextWidget(
            text: "مهامك في ذلك اليوم",
            style: Styles.style10,
          ),
          SizedBox(
            height: 24.h,
          ),
          const TaskItem()
        ],
      ),
    );
  }
}
