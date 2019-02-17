import 'dart:async';
import 'package:redux/redux.dart';
import 'package:flulabs/redux/app/app_state.dart';
import 'package:flulabs/redux/middleware/local_storage_middleware.dart';
import 'package:flulabs/redux/middleware/navigation_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flulabs/redux/app/app_reducer.dart';

Future<Store<AppState>> createStore() async {
  var prefs = await SharedPreferences.getInstance();
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      LoggingMiddleware.printer(),
      LocalStorageMiddleware(prefs),
      NavigationMiddleware()
    ],
  );
}
