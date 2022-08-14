import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void initFunction() {
    if (kDebugMode) log("Init splash functions ... ");
    Future.delayed(const Duration(seconds: 2), () {
      if (kDebugMode) log("Splash timer ended . ");
      emit(SplashFinished());
    });
  }
}
