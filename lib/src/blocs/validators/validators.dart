import 'dart:async';

class Validators {
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Incorrect Email');
      }
    },
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 3) {
        sink.add(password);
      } else {
        sink.addError('Incorrect Password');
      }
    },
  );
}
