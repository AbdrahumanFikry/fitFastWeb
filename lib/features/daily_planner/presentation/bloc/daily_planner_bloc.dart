import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'daily_planner_event.dart';
part 'daily_planner_state.dart';

class DailyPlannerBloc extends Bloc<DailyPlannerEvent, DailyPlannerState> {
  DailyPlannerBloc() : super(DailyPlannerInitial()) {
    on<DailyPlannerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
