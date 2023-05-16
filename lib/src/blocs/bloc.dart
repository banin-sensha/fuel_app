import 'dart:async';

import 'package:fuel/src/blocs/validators/validators.dart';

class Bloc extends Validators {
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
}

final bloc = Bloc();
