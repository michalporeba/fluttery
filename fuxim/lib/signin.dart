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
  List<MockUser> _userData;
  dynamic users;
  String? prompt;
  Function(String) onSignIn;

  MockSignInPage({
    required this.users,
    required this.onSignIn,
    this.prompt,
    Key? key
  }) : _userData = _generateUsers(users),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(prompt ?? 'Who are you?', style: Theme.of(context).textTheme.headline4),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _usersCount(),
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

  int _usersCount() {
    if (users is int) {
      return users as int;
    }
    return (users as List<String>).length;
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

String? get(List<String> list, int i) {
  return (i >= list.length) ? null : list[i];
}

List<MockUser> _generateUsers(dynamic users) {
  List<String> names = [];
  if (users is! int) {
    names = users as List<String>;
  }
  const String baseUrl = 'https://picsum.photos/200?image=';
  return <MockUser>[
    MockUser(name: get(names, 0) ?? 'Aneirin', image: baseUrl+'1005'),
    MockUser(name: get(names, 1) ?? 'Branwen', image: baseUrl+'1006'),
    MockUser(name: get(names, 2) ?? 'Caradog', image: baseUrl+'1063'),
    MockUser(name: get(names, 3) ?? 'Dylan', image: baseUrl+'101'),
    MockUser(name: get(names, 4) ?? 'Elliw', image: baseUrl+'1014'),
    MockUser(name: get(names, 5) ?? 'Fflur', image: baseUrl+'1025'),
    MockUser(name: get(names, 6) ?? 'Geraint', image: baseUrl+'103'),
    MockUser(name: get(names, 7) ?? 'Hywel', image: baseUrl+'1031'),
    MockUser(name: get(names, 8) ?? 'Ianto', image: baseUrl+'1033'),
    MockUser(name: get(names, 9) ?? 'Lori', image: baseUrl+'1054'),
    MockUser(name: get(names, 10) ?? 'Llew', image: baseUrl+'1074'),
    MockUser(name: get(names, 11) ?? 'Mari', image: baseUrl+'1070'),
    MockUser(name: get(names, 12) ?? 'Noni', image: baseUrl+'1076'),
    MockUser(name: get(names, 13) ?? 'Owen', image: baseUrl+'1078'),
    MockUser(name: get(names, 14) ?? 'Rhydian', image: baseUrl+'1079'),
  ];
}