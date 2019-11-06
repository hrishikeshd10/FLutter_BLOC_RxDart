import 'dart:async';

import 'package:login_bloc/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class BLOC extends Object with Validators {
  // TODO: Step1:  Create StreamControllers for Email and Password Fields

  final _emailController = BehaviorSubject<
      String>(); // Subjects are the way of RxDart to represent StreamController<String>
  final _passwordController = BehaviorSubject<String>();

//TODO: Step 2:  Add Data to the streams if the data is valid {DATA VALIDATION} use transformers
//TODO: Step 4 Return the transformed Stream so that other widgets can listen on it.

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

//Create a combined Stream that returns true if the values from email and password are valid

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  //TODO: Step 3: Change the Data--- to be called on onChanged function

  Function(String) get changeEmail => _emailController.sink.add;
  //a method to take string and add it to the sink when the user types on to the textinputfield

  Function(String) get changePassword => _passwordController.sink.add;

//TODO: Step 5 : Create Dispose the metod to close the sinks:

  submit() {
    final email = _emailController.value;
    final password = _passwordController.value;

    print('Email: $email');
    print('Password: $password');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
