import 'package:redux/redux.dart';
import 'package:flulabs/redux/pages/auth_actions.dart';
import 'package:flulabs/redux/pages/product/product_state.dart';

final productReducer = combineReducers<ProductState>([
  TypedReducer<ProductState, ChangeLoadingStatusAction>(
      _changeLoadingStatusAction),
  TypedReducer<ProductState, ChangeScreenStateAction>(_changeScreenStateAction),
]);

ProductState _changeScreenStateAction(
        ProductState state, ChangeScreenStateAction action) =>
    state.copyWith(type: action.type);

ProductState _changeLoadingStatusAction(
        ProductState state, ChangeLoadingStatusAction action) =>
    state.copyWith(loadingStatus: action.status);
