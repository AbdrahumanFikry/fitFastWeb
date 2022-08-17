part of 'daily_planner_bloc.dart';

class DailyPlannerState extends Equatable {
  final String? selectedPlan;
  final String? selectedCategory;
  final DateTime? selectedDate;
  final List<DateTime>? availableDates;

  const DailyPlannerState({
    this.selectedPlan = "Silver",
    this.selectedCategory = "Meat Meals",
    this.selectedDate,
    this.availableDates = const [],
  });

  DailyPlannerState copyWith({
    String? selectedPlan,
    String? selectedCategory,
    DateTime? selectedDate,
    List<DateTime>? availableDates,
  }) =>
      DailyPlannerState(
        selectedCategory: selectedCategory ?? this.selectedCategory,
        selectedPlan: selectedPlan ?? this.selectedPlan,
        selectedDate: selectedDate ?? this.selectedDate,
        availableDates: availableDates ?? this.availableDates,
      );

  @override
  List<Object?> get props => [
        selectedPlan,
        selectedCategory,
        selectedDate,
        availableDates,
      ];
}
