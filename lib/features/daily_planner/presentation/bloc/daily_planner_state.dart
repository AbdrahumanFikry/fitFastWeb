part of 'daily_planner_bloc.dart';

abstract class DailyPlannerState extends Equatable {
  const DailyPlannerState();
}

class DailyPlannerInitial extends DailyPlannerState {
  @override
  List<Object> get props => [];
}
