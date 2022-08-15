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
  ) =>
      emit(state.copyWith(selectedDate: DateTime.now()));

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
}
