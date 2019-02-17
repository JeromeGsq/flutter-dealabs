import 'package:redux/redux.dart';
import 'package:flulabs/redux/app/app_state.dart';
import 'package:flulabs/redux/auth/auth_actions.dart';
import 'package:flulabs/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageMiddleware extends MiddlewareClass<AppState> {
  final SharedPreferences preferences;

  LocalStorageMiddleware(this.preferences);

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
    if (action is CheckTokenAction) {
      var token = preferences.getString(TOKEN);
      if (token != null && token.isNotEmpty) {
        action.hasTokenCallback();
      } else {
        action.noTokenCallback();
      }
    }
  }
}
