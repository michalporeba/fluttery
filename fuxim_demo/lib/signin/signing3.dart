import 'package:flutter/material.dart';
import 'package:fuxim/signin.dart';

class SignInThree extends StatelessWidget {
  const SignInThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MockSignInPage(
        prompt: 'Custom names',
        users: const ['Adam', 'Bary', 'Chris', 'Dani', 'Erick'],
        onSignIn: (name) => true
    );
  }
}
