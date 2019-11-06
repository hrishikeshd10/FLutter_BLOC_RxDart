import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    //email is a string that needs to be validated
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid Email');
    }
  });
}

final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
  //password is also a string that needs to be validated
  if (password.length > 3) {
    sink.add(password);
  } else {
    sink.addError('Password should be greater than 3 characters');
  }
});
