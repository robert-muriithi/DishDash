part of 'onboarding_status_cubit.dart';

class OnboardingStatusState extends Equatable {
  final bool isOnboardingDone;
  final String? exception;
  final UIState uiState;
  const OnboardingStatusState( {this.isOnboardingDone = false, this.exception, this.uiState = UIState.initial} );

  @override
  List<Object?> get props => [isOnboardingDone, exception, uiState];

  OnboardingStatusState copyWith({
    bool? isOnboardingDone,
    String? exception,
    UIState? uiState,
  }) {
    return OnboardingStatusState(
      isOnboardingDone: isOnboardingDone ?? this.isOnboardingDone,
      exception: exception ?? this.exception,
      uiState: uiState ?? this.uiState,
    );
  }
}


