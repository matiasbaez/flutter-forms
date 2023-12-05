
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {

  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {}

  void onUsernameChanged( String value ) {
    emit( state.copyWith( username: value ) );
  }

  void onEmailChanged( String value ) {
    emit( state.copyWith( email: value ) );
  }

  void onPasswordChanged( String value ) {
    emit( state.copyWith( password: value ) );
  }

}
