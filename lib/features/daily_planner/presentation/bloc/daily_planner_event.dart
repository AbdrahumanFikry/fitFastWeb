part of 'daily_planner_bloc.dart';

abstract class DailyPlannerEvent extends Equatable {
  const DailyPlannerEvent();
}

class InitPlanner extends DailyPlannerEvent {
  @override
  List<Object?> get props => [];
}

class SelectPlan extends DailyPlannerEvent {
  final String plan;

  const SelectPlan(this.plan);

  @override
  List<Object?> get props => [plan];
}

class SelectCategory extends DailyPlannerEvent {
  final String category;

  const SelectCategory(this.category);

  @override
  List<Object?> get props => [category];
}

class SelectDate extends DailyPlannerEvent {
  final DateTime dateTime;

  const SelectDate(this.dateTime);

  @override
  List<Object?> get props => [dateTime];
}
