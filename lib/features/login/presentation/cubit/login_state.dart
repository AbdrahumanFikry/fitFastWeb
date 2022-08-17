part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.hidePassword = true,
    this.loading = false,
    this.password = '',
    this.email = '',
    this.errorMessage = '',
  });

  final bool hidePassword;
  final bool loading;
  final String password;
  final String email;
  final String errorMessage;

  LoginState copyWith({
    bool? hidePassword,
    String? password,
    String? email,
    String? errorMessage,
    bool? loading,
  }) =>
      LoginState(
        hidePassword: hidePassword ?? this.hidePassword,
        email: email ?? this.email,
        password: password ?? this.password,
        errorMessage: errorMessage ?? this.errorMessage,
        loading: loading ?? this.loading,
      );

  @override
  List<Object?> get props => [
        hidePassword,
        email,
        password,
        errorMessage,
        loading,
      ];
}
