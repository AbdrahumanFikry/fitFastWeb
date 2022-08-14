import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daily_planner_event.dart';

part 'daily_planner_state.dart';

class DailyPlannerBloc extends Bloc<DailyPlannerEvent, DailyPlannerState> {
  DailyPlannerBloc() : super(const DailyPlannerState()) {
    on<SelectPlan>(_onSelectPlan);
    on<SelectCategory>(_onSelectCategory);
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
}
