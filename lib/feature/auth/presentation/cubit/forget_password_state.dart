part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  final UIState uiState;
  final String? exception;
  const ForgetPasswordState({this.uiState = UIState.initial, this.exception});

  @override
  List<Object?> get props => [uiState, exception];

  ForgetPasswordState copyWith({
    UIState? uiState,
    String? exception,
  }) {
    return ForgetPasswordState(
      uiState: uiState ?? this.uiState,
      exception: exception ?? this.exception,
    );
  }
}


