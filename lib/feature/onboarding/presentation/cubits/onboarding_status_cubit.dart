import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/onboarding/domain/usecase/set_onboarding_status_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_status_state.dart';

class OnboardingStatusCubit extends Cubit<OnboardingStatusState> {
  final SetOnboardingStatusUsCase setOnboardingStatusUsCase;
  OnboardingStatusCubit(this.setOnboardingStatusUsCase) : super(const OnboardingStatusState());


  Future<void> finishOnboarding() async {
    try {
      final result = await setOnboardingStatusUsCase(NoParams());
      result.fold(
          (failure) => emit(state.copyWith(
              uiState: UIState.error, exception: failure.toString())),
          (data) =>
              emit(state.copyWith(uiState: UIState.success, isOnboardingDone: true)));
    } on Exception catch (e) {
      emit(state.copyWith(uiState: UIState.error, exception: e.toString()));
    }
  }
}
