part of 'sign_in_with_google_cubit.dart';

class SignInWithGoogleState extends Equatable {
  final UserModel? user;
  final UIState uiState;
  final String? exception;
  const SignInWithGoogleState({this.user, this.uiState = UIState.initial, this.exception});

  @override
  List<Object?> get props => [user, uiState, exception];

  SignInWithGoogleState copyWith({
    UserModel? user,
    UIState? uiState,
    String? exception,
  }) {
    return SignInWithGoogleState(
      user: user ?? this.user,
      uiState: uiState ?? this.uiState,
      exception: exception ?? this.exception,
    );
  }
}

