part of 'planner_bloc.dart';

abstract class PlannerEvent extends Equatable {}

class ChangePlanEvent extends PlannerEvent {
  final int index;

  ChangePlanEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class SelectCategoryEvent extends PlannerEvent {
  final String category;

  SelectCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}
