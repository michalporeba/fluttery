library fuxim;

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MockUser {
  final String name;
  final String image;
  const MockUser({
    required this.name,
    required this.image
  });
}

class MockSignInPage extends StatelessWidget {
  List<MockUser> _userData = _generateUsers();
  int users;
  Function(String) onSignIn;

  MockSignInPage({
    required this.users,
    required this.onSignIn,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('Who are you?', style: Theme.of(context).textTheme.headline4),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: users,
            itemBuilder: (BuildContext _context, int index) {
              if (index < _userData.length) {
                return UserButton(onSignIn: onSignIn, user: _userData[index]);
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}

class UserButton extends StatelessWidget {
  final MockUser user;
  final Function(String) onSignIn;

  const UserButton({
    required this.onSignIn,
    required this.user,
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
          onTap: () { onSignIn(user.name); },
          child: Row(
              children: [
                const SizedBox(width: 24),
                Ink.image(
                    colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.color),
                    image: NetworkImage(user.image),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                ),

                const SizedBox(width: 12),
                Text(user.name, style: Theme.of(context).textTheme.headline4),
              ]
          ),
        ),
      ),
    );

  }
}

List<MockUser> _generateUsers() {
  const String baseUrl = 'https://picsum.photos/200?image=';
  return const <MockUser>[
    MockUser(name: 'Aneirin', image: baseUrl+'1005'),
    MockUser(name: 'Branwen', image: baseUrl+'1006'),
    MockUser(name: 'Caradog', image: baseUrl+'1063'),
    MockUser(name: 'Dylan', image: baseUrl+'101'),
    MockUser(name: 'Elliw', image: baseUrl+'1014'),
    MockUser(name: 'Fflur', image: baseUrl+'1025'),
    MockUser(name: 'Geraint', image: baseUrl+'103'),
    MockUser(name: 'Hywel', image: baseUrl+'1031'),
    MockUser(name: 'Ianto', image: baseUrl+'1033'),
    MockUser(name: 'Lori', image: baseUrl+'1054'),
    MockUser(name: 'Llew', image: baseUrl+'1074'),
    MockUser(name: 'Mari', image: baseUrl+'1070'),
    MockUser(name: 'Noni', image: baseUrl+'1076'),
    MockUser(name: 'Owen', image: baseUrl+'1078'),
    MockUser(name: 'Rhydian', image: baseUrl+'1079'),
  ];
}