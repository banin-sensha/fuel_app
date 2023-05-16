import 'package:flutter/material.dart';
import 'package:fuel/src/blocs/bloc.dart';
import 'package:fuel/src/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(margin: const EdgeInsets.only(bottom: 150.0)),
          const Icon(Icons.local_gas_station, size: 70.0),
          Container(margin: const EdgeInsets.only(bottom: 50.0)),
          emailField(),
          passwordField(),
          submitButton(context),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            label: const Text('Enter your Email'),
            hintText: 'you@example.com',
            errorText: snapshot.error?.toString(),
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            label: const Text('Enter your Password'),
            hintText: 'Password',
            errorText: snapshot.error?.toString(),
          ),
        );
      },
    );
  }

  Widget submitButton(context) {
    return ElevatedButton(
      child: const Text('Submit'),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen())),
    );
  }
}
