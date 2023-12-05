
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:forms/presentation/views/views.dart';
import 'package:forms/presentation/blocs/register/register_cubit.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: BlocProvider(
        create: (_) => RegisterCubit(),
        child: const RegisterView()
      ),
    );
  }

}


