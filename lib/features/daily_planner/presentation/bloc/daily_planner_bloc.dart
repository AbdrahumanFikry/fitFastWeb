import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daily_planner_event.dart';

part 'daily_planner_state.dart';

class DailyPlannerBloc extends Bloc<DailyPlannerEvent, DailyPlannerState> {
  DailyPlannerBloc() : super(const DailyPlannerState()) {
    on<InitPlanner>(_onInitPlanner);
    on<SelectPlan>(_onSelectPlan);
    on<SelectCategory>(_onSelectCategory);
    on<SelectDate>(_onSelectDate);
  }

  final ScrollController datesScrollController = ScrollController();

  void _onInitPlanner(
    InitPlanner event,
    Emitter<DailyPlannerState> emit,
  ) {
    final now = DateTime.now();
    final nextDay = now.add(const Duration(days: 1));
    DateTime startDate = DateTime(now.year, now.month, now.day, 0, 0, 0);
    if (nextDay.difference(now).inHours < 1) {
      startDate = DateTime(nextDay.year, nextDay.month, nextDay.day, 0, 0, 0);
    }

    final currentMonthDays = getDaysInMonth(startDate.year, startDate.month);
    final restOfCurrentMonthDays = List.generate(
      (currentMonthDays - startDate.day) + 1,
      (index) => startDate.add(
        Duration(days: index),
      ),
    );

    emit(state.copyWith(
      selectedDate: startDate,
      availableDates: restOfCurrentMonthDays,
    ));
  }

  void _onSelectPlan(
    SelectPlan event,
    Emitter<DailyPlannerState> emit,
  ) =>
      emit(state.copyWith(selectedPlan: event.plan));

  void _onSelectCategory(
    SelectCategory event,
    Emitter<DailyPlannerState> emit,
  ) =>
      emit(state.copyWith(selectedCategory: event.category));

  void _onSelectDate(
    SelectDate event,
    Emitter<DailyPlannerState> emit,
  ) =>
      emit(state.copyWith(selectedDate: event.dateTime));

  int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[
      31,
      -1,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    return daysInMonth[month - 1];
  }
}
