import 'package:flulabs/redux/app/app_state.dart';
import 'package:flulabs/redux/auth/signin/signin_reducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    new AppState(productState: signinReducer(state.productState, action));
