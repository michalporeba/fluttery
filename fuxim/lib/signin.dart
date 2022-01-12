library fuxim;

import 'package:flutter/material.dart';

class MockSignInPage extends StatelessWidget {
  List<String> _userData = ['Aneirin', 'Branwen', 'Caradog', 'D', 'DD', 'E', 'F', 'FF'];
  int users;
  Function(String) onSignIn;

  MockSignInPage({
    required this.users,
    required this.onSignIn,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: users,
      itemBuilder: (BuildContext _context, int index) {
        if (index < _userData.length) {
          return UserButton(onSignIn: onSignIn, name: _userData[index]);
        }
        return Container();
      },
    );
  }
}

class UserButton extends StatelessWidget {
  final String name;
  final String image;
  final Function(String) onSignIn;

  const UserButton({
    required this.onSignIn,
    required this.name,
    this.image = '1005',
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        elevation: 8,
        borderRadius: BorderRadius.circular(24),
        child:
        InkWell(
          onTap: () { onSignIn(name); },
          child: Row(
              children: [
                const SizedBox(width: 24),
                Ink.image(
                  image: NetworkImage('https://picsum.photos/200?image='+image),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Text(name, style: Theme.of(context).textTheme.headline4),
              ]
          ),
        ),
      ),
    );

  }
}

