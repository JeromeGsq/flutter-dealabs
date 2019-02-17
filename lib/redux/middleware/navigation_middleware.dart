import 'package:redux/redux.dart';
import 'package:flulabs/redux/app/app_state.dart';
import 'package:flulabs/redux/pages/auth_actions.dart';
import 'package:flulabs/redux/pages/keys.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is NavigateToProductAction) {
      Keys.navKey.currentState.pushNamed("/product");
    }
    next(action);
  }
}
