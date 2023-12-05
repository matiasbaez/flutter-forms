
import 'package:flutter/material.dart';

import 'package:forms/presentation/views/views.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const RegisterView(),
    );
  }

}


