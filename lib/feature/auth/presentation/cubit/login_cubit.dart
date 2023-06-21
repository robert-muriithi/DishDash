import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/auth/domain/model/user_model.dart';
import 'package:DishDash/feature/auth/domain/usecase/login_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase usecase;
  LoginCubit(this.usecase) : super(const LoginState());

  Future<void> login({required String email, required String password}) async {
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
