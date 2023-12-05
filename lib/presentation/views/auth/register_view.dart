import 'package:flutter/material.dart';

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

  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [

           CustomTextFormField(
            label: 'Username',
            prefixIcon: const Icon( Icons.person ),
            onChanged: (value) => username = value,
            isRequired: true,
          ),

          const SizedBox(height: 10),

           CustomTextFormField(
            label: 'Email',
            prefixIcon: const Icon( Icons.alternate_email ),
            onChanged: (value) => email = value,
            isRequired: true,
          ),

          const SizedBox(height: 10),

           CustomTextFormField(
            label: 'Password',
            obscureText: true,
            prefixIcon: const Icon( Icons.lock_outline_rounded ),
            onChanged: (value) => password = value,
            isRequired: true,
          ),

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('is valid');
                return;
              }

              print('invalid form');
            },
            icon: const Icon( Icons.save ),
            label: const Text('Create user'),
          ),

        ],
      ),
    );
  }
}

