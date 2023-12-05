import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms/presentation/blocs/register/register_cubit.dart';

import 'package:forms/presentation/widgets/widgets.dart';

class RegisterView extends StatelessWidget {

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {

    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [

              FlutterLogo( size: 100 ),

              SizedBox(height: 20),

              _RegisterForm(),

              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {

  const _RegisterForm();

  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      child: Column(
        children: [

           CustomTextFormField(
            label: 'Username',
            prefixIcon: const Icon( Icons.person ),
            onChanged: registerCubit.onUsernameChanged,
            errorText: username.errorMessage,
          ),

          const SizedBox(height: 10),

           CustomTextFormField(
            label: 'Email',
            prefixIcon: const Icon( Icons.alternate_email ),
            onChanged: registerCubit.onEmailChanged,
            errorText: email.errorMessage,
          ),

          const SizedBox(height: 10),

           CustomTextFormField(
            label: 'Password',
            obscureText: true,
            prefixIcon: const Icon( Icons.lock_outline_rounded ),
            onChanged: registerCubit.onPasswordChanged,
            errorText: password.errorMessage,
          ),

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: registerCubit.onSubmit,
            icon: const Icon( Icons.save ),
            label: const Text('Create user'),
          ),

        ],
      ),
    );
  }
}

