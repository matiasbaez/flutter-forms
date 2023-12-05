part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {

  final Username username;
  final Email email;
  final Password password;
  final bool isValid;
  final FormStatus formStatus;

  const RegisterFormState({
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.formStatus = FormStatus.invalid
  });

  @override
  List<Object> get props => [ username, email, password, formStatus ];

  RegisterFormState copyWith({
    Username? username,
    Email? email,
    Password? password,
    bool? isValid,
    FormStatus? formStatus,
  }) => RegisterFormState(
    username: username ?? this.username,
    email: email ?? this.email,
    isValid: isValid ?? this.isValid,
    password: password ?? this.password,
    formStatus: formStatus ?? this.formStatus,
  );
}
