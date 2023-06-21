part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String? exception;
  final UIState uiState;
  final UserModel? user;
  const LoginState({this.exception, this.user, this.uiState = UIState.initial});

  @override
  List<Object?> get props => [exception, user, uiState];

  LoginState copyWith({
    String? exception,
    UIState? uiState,
    UserModel? user,
  }) {
    return LoginState(
      exception: exception ?? this.exception,
      uiState: uiState ?? this.uiState,
      user: user ?? this.user,
    );
  }
}


