import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/login_screen.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Log me In',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
