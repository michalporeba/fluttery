import 'package:flutter/material.dart';
import 'package:fuxim/signin.dart';

class SignInTwo extends StatelessWidget {
  const SignInTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MockSignInPage(
        prompt: 'Sign in as',
        users: 15,
        onSignIn: (name) => true
    );
  }
}
