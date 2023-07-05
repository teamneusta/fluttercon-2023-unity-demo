import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  final ValueChanged<String> login;

  const LoginView({required this.login});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _playerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextField(
            controller: _playerName,
            decoration: const InputDecoration(
              hintText: 'Enter your name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextButton(
            onPressed: () => widget.login(_playerName.text),
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }
}
