import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'planner_event.dart';

part 'planner_state.dart';

class PlannerBloc extends Bloc<PlannerEvent, PlannerState> {
  PlannerBloc() : super(const PlannerState()) {
    on<ChangePlanEvent>(_onChangePlanEvent);
    on<SelectCategoryEvent>(_onSelectCategoryEvent);
  }

  void _onChangePlanEvent(ChangePlanEvent event, Emitter<PlannerState> emit) =>
      emit(state.copyWith(planIndex: event.index));

  void _onSelectCategoryEvent(
      SelectCategoryEvent event, Emitter<PlannerState> emit) {}

  final _categories = <String>[
    "All products",
    "Protein",
    "Carbs",
    "Fats",
    "Green",
  ];

  Future<List<String>> fetchProducts(String category) async {
    final List<String> matches = <String>[];
    matches.addAll(_categories);

    matches.retainWhere(
      (b) => b.toLowerCase().contains(category.toLowerCase()),
    );
    return matches;
  }
}
