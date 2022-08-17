import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void changePasswordObscuring() =>
      emit(state.copyWith(hidePassword: !state.hidePassword));

  void changeEmail(String value) => emit(state.copyWith(email: value));

  void changePassword(String value) => emit(state.copyWith(password: value));

  void changeLoadingState(bool value) => emit(state.copyWith(loading: value));

  void changeErrorMessage(String value) =>
      emit(state.copyWith(errorMessage: value));

  bool validated() {
    if (state.email.isEmpty) return false;
    if (state.password.isEmpty) return false;
    return true;
  }

  Future<void> login() async {
    if (!validated()) {
      changeErrorMessage("Fill data");
      return;
    }

    try {
      changeLoadingState(true);
      await Future.delayed(const Duration(seconds: 2));
      changeLoadingState(false);
    } catch (e) {
      changeLoadingState(false);
      changeErrorMessage(e.toString());
    }
  }
}
