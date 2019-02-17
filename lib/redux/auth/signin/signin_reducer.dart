import 'package:redux/redux.dart';
import 'package:flulabs/models/loading_status.dart';
import 'package:flulabs/redux/auth/auth_actions.dart';
import 'package:flulabs/redux/auth/screen.dart';
import 'package:flulabs/redux/auth/signin/singin_state.dart';

final signinReducer = combineReducers<ProductState>([
  TypedReducer<ProductState, ValidateEmailAction>(_validateEmail),
  TypedReducer<ProductState, ValidatePasswordAction>(_validatePassword),
  TypedReducer<ProductState, ValidateLoginFields>(_validateLoginFieldsAction),
  TypedReducer<ProductState, ChangeLoadingStatusAction>(
      _changeLoadingStatusAction),
  TypedReducer<ProductState, SaveTokenAction>(_saveToken),
  TypedReducer<ProductState, ConfirmForgotPasswordAction>(_confirmCodeAction),
  TypedReducer<ProductState, CheckTokenAction>(_checkTokenAction),
  TypedReducer<ProductState, ClearErrorsAction>(_clearErrorsAction),
  TypedReducer<ProductState, ChangeScreenStateAction>(_changeScreenStateAction),
]);

ProductState _changeScreenStateAction(
        ProductState state, ChangeScreenStateAction action) =>
    state.copyWith(type: action.type);

ProductState _validateEmail(ProductState state, ValidateEmailAction action) {
  return state.copyWith(email: action.email);
}

ProductState _validatePassword(
        ProductState state, ValidatePasswordAction action) =>
    state.copyWith(password: action.password);

ProductState _validateLoginFieldsAction(
        ProductState state, ValidateLoginFields action) =>
    state;

ProductState _changeLoadingStatusAction(
        ProductState state, ChangeLoadingStatusAction action) =>
    state.copyWith(loadingStatus: action.status);

ProductState _saveToken(ProductState state, SaveTokenAction action) =>
    state.copyWith(token: action.token);

ProductState _confirmCodeAction(
        ProductState state, ConfirmForgotPasswordAction action) =>
    state;

ProductState _checkTokenAction(ProductState state, CheckTokenAction action) =>
    state;

ProductState _clearErrorsAction(ProductState state, ClearErrorsAction action) =>
    state.copyWith(
        loadingStatus: LoadingStatus.success,
        emailError: "",
        passwordError: "",
        retypePasswordError: "");
