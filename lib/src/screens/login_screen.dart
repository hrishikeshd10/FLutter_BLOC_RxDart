import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            emailField(bloc),
            SizedBox(
              height: 20.0,
            ),
            passwordField(bloc),
            SizedBox(
              height: 20.0,
            ),
            submitButton(bloc)
          ],
        ),
      ),
    );
  }

  Widget emailField(BLOC bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                errorText: snapshot.error,
                hintText: 'you@dxample.com',
                labelText: 'Email Address',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.5))),
            onChanged: bloc.changeEmail,
          );
        });
  }

  Widget passwordField(BLOC bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextFormField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                errorText: snapshot.error,
                hintText: 'password',
                labelText: 'Password',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.5))));
      },
    );
  }

  Widget submitButton(BLOC bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return RaisedButton(
            color: Colors.blue,
            child: Text('Submit Button'),
            onPressed: (snapshot.hasData)
                ? () {
                    bloc.submit();
                  }
                : null,
          );
        });
  }
}
