part of 'daily_planner_bloc.dart';

class DailyPlannerState extends Equatable {
  final String? selectedPlan;
  final String? selectedCategory;

  const DailyPlannerState({
    this.selectedPlan = "Silver",
    this.selectedCategory = "Meat Meals",
  });

  DailyPlannerState copyWith({
    String? selectedPlan,
    String? selectedCategory,
  }) =>
      DailyPlannerState(
        selectedCategory: selectedCategory ?? this.selectedCategory,
        selectedPlan: selectedPlan ?? this.selectedPlan,
      );

  @override
  List<Object?> get props => [selectedPlan, selectedCategory];
}
