import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/auth/domain/model/user_model.dart';
import 'package:DishDash/feature/auth/domain/usecase/google_sign_in_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_with_google_state.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  final SignInWithGoogleUseCase usecase;
  SignInWithGoogleCubit(this.usecase) : super(const SignInWithGoogleState());

  Future<void> signInWithGoogle() async {
    try{
      emit(state.copyWith(uiState: UIState.loading));
      final result = await usecase(NoParams());
      result.fold(
            (failure) => emit(state.copyWith(uiState:UIState.error, exception: mapFailureToMessage(failure))),
            (user) => emit(state.copyWith(uiState: UIState.success, user: user)),
      );
    } catch (e) {
      emit(state.copyWith(uiState:UIState.error, exception: e.toString()));
    }
  }
}
