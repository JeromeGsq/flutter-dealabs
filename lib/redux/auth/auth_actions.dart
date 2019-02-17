import 'dart:ui';

import 'package:flulabs/models/loading_status.dart';

import 'screen_state.dart';
import 'screen.dart';

class ValidateEmailAction {
  final String email;
  final Screen screen;
  ValidateEmailAction(this.email, this.screen);
}

class ValidatePasswordAction {
  final String password;
  final Screen screen;
  ValidatePasswordAction(this.password, this.screen);
}

class ValidateLoginFields {
  final String email;
  final String password;

  ValidateLoginFields(this.email, this.password);
}

class ValidatePasswordMatchAction {
  final String password;
  final String confirmPassword;
  final Screen screen;
  ValidatePasswordMatchAction(this.password, this.confirmPassword, this.screen);
}

class ValidateCodeAction {
  final String code;
  ValidateCodeAction(this.code);
}

class ChangeScreenStateAction {
  final ScreenState type;
  ChangeScreenStateAction(this.type);
}

class ChangeLoadingStatusAction {
  final LoadingStatus status;
  ChangeLoadingStatusAction(this.status);
}

class EmailErrorAction {
  final String message;
  final Screen screen;
  EmailErrorAction(this.message, this.screen);
}

class PasswordErrorAction {
  final String message;
  final Screen screen;
  PasswordErrorAction(this.message, this.screen);
}

class RetypePasswordErrorAction {
  final String message;
  final Screen screen;
  RetypePasswordErrorAction(this.message, this.screen);
}

class CodeErrorAction {
  final String message;
  CodeErrorAction(this.message);
}

class SaveTokenAction {
  final String token;
  SaveTokenAction(this.token);
}

class RequestCodeAction {
  final String email;
  RequestCodeAction(this.email);
}

class ConfirmForgotPasswordAction {
  final String code;
  final String password;
  ConfirmForgotPasswordAction(this.code, this.password);
}

class CheckTokenAction {
  final VoidCallback hasTokenCallback;
  final VoidCallback noTokenCallback;

  CheckTokenAction({this.hasTokenCallback, this.noTokenCallback});
}

class ClearErrorsAction {}

class NavigateToRegistrationAction {}
