import 'package:flutter/material.dart';
import 'package:productos_app/src/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
        ],
      ),
    )));
  }
}
