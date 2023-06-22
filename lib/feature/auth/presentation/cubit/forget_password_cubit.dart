import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/auth/domain/usecase/reset_password_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ResetPasswordUseCase usecase;
  ForgetPasswordCubit(this.usecase) : super(const ForgetPasswordState());

  Future<void> resetPassword({required String email}) async {
    try{
      emit(state.copyWith(uiState: UIState.loading));
      final result = await usecase(email);
      result.fold(
            (failure) => emit(state.copyWith(uiState:UIState.error, exception: mapFailureToMessage(failure))),
            (_) => emit(state.copyWith(uiState: UIState.success)),
      );
    } catch (e) {
      emit(state.copyWith(uiState:UIState.error, exception: e.toString()));
    }
  }
}
