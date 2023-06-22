part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String? exception;
  final UIState uiState;
  final String? user;
  const RegisterState({this.exception, this.user, this.uiState = UIState.initial});

  @override
  List<Object?> get props => [exception, user, uiState];

  RegisterState copyWith({
    String? exception,
    UIState? uiState,
    String? user,
  }) {
    return RegisterState(
      exception: exception ?? this.exception,
      uiState: uiState ?? this.uiState,
      user: user ?? this.user,
    );
  }
}


