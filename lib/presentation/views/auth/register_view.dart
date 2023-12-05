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

class _RegisterForm extends StatefulWidget {


  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formKey,
      child: Column(
        children: [

           CustomTextFormField(
            label: 'Username',
            prefixIcon: const Icon( Icons.person ),
            onChanged: (value) {
              registerCubit.onUsernameChanged(value);
              _formKey.currentState!.validate();
            },
            isRequired: true,
          ),

          const SizedBox(height: 10),

           CustomTextFormField(
            label: 'Email',
            prefixIcon: const Icon( Icons.alternate_email ),
            onChanged: (value) {
              registerCubit.onEmailChanged(value);
              _formKey.currentState!.validate();
            },
            isRequired: true,
          ),

          const SizedBox(height: 10),

           CustomTextFormField(
            label: 'Password',
            obscureText: true,
            prefixIcon: const Icon( Icons.lock_outline_rounded ),
            onChanged: (value) {
              registerCubit.onPasswordChanged(value);
              _formKey.currentState!.validate();
            },
            isRequired: true,
          ),

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                registerCubit.onSubmit();
              }
            },
            icon: const Icon( Icons.save ),
            label: const Text('Create user'),
          ),

        ],
      ),
    );
  }
}

