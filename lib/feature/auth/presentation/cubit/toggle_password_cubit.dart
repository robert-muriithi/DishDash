import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_password_state.dart';

class TogglePasswordCubit extends Cubit<TogglePasswordState> {
  TogglePasswordCubit() : super(const TogglePasswordState());

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}
