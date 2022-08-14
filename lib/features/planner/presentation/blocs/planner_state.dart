part of 'planner_bloc.dart';

class PlannerState extends Equatable {
  final int planIndex;

  const PlannerState({
    this.planIndex = 0,
  });

  PlannerState copyWith({int? planIndex}) => PlannerState(
        planIndex: planIndex ?? this.planIndex,
      );

  @override
  List<Object?> get props => [planIndex];
}
