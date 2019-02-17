import 'package:redux/redux.dart';
import 'package:flulabs/redux/app/app_state.dart';
import 'package:flulabs/redux/pages/auth_actions.dart';
import 'package:flulabs/redux/pages/screen.dart';
import 'package:flulabs/utils/strings.dart';

class ValidationMiddleware extends MiddlewareClass<AppState> {
  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is ValidateEmailAction) {
      validateEmail(action.screen, action.email, next);
    }

    if (action is ValidatePasswordAction) {
      validatePassword(action.screen, action.password, next);
    }

    if (action is ValidatePasswordMatchAction) {
      validatePassMatch(
          action.screen, action.password, action.confirmPassword, next);
    }

    if (action is ValidateCodeAction) {
      if (isNumeric(action.code) && action.code.length >= 6) {
        next(new CodeErrorAction(""));
      } else {
        next(CodeErrorAction(code_error));
      }
    }
    next(action);
  }

  void validatePassMatch(Screen screen, String password, String confirmPassword,
      NextDispatcher next) {
    if (password != confirmPassword) {
      next(new RetypePasswordErrorAction(password_match_error, screen));
    } else {
      next(new RetypePasswordErrorAction("", screen));
    }
  }

  void validatePassword(Screen screen, String password, NextDispatcher next) {
    if (password.length < 6) {
      next(new PasswordErrorAction(password_error, screen));
    } else {
      next(new PasswordErrorAction("", screen));
    }
  }

  void validateEmail(Screen screen, String email, NextDispatcher next) {
    RegExp exp = new RegExp(emailPattern);
    if (!exp.hasMatch(email)) {
      next(new EmailErrorAction(email_error, screen));
    } else {
      next(new EmailErrorAction("", screen));
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }
}
