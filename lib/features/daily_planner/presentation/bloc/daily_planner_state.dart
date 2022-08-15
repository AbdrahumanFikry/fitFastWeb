part of 'daily_planner_bloc.dart';

class DailyPlannerState extends Equatable {
  final String? selectedPlan;
  final String? selectedCategory;
  final DateTime? selectedDate;

  const DailyPlannerState({
    this.selectedPlan = "Silver",
    this.selectedCategory = "Meat Meals",
    this.selectedDate,
  });

  DailyPlannerState copyWith({
    String? selectedPlan,
    String? selectedCategory,
    DateTime? selectedDate,
  }) =>
      DailyPlannerState(
        selectedCategory: selectedCategory ?? this.selectedCategory,
        selectedPlan: selectedPlan ?? this.selectedPlan,
        selectedDate: selectedDate ?? this.selectedDate,
      );

  @override
  List<Object?> get props => [selectedPlan, selectedCategory, selectedDate];
}
