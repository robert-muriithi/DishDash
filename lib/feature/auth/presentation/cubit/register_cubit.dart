import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/auth/domain/usecase/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase usecase;
  RegisterCubit(this.usecase) : super(const RegisterState());

  Future<void> register({required String email, required String password}) async {
    try{
      emit(state.copyWith(uiState: UIState.loading));
      final result = await usecase(LoginParams(email: email, password: password));
      result.fold(
            (failure) => emit(state.copyWith(uiState:UIState.error, exception: mapFailureToMessage(failure))),
            (user) => emit(state.copyWith(uiState: UIState.success, user: user)),
      );
    } catch (e) {
      emit(state.copyWith(uiState:UIState.error, exception: e.toString()));
    }
  }
}
