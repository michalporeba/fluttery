import 'package:flutter/material.dart';
import 'package:fuxim/signin.dart';

class SignInOne extends StatelessWidget {
  const SignInOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MockSignInPage(
        users: 3,
        onSignIn: (name) => true
    );
  }
}
