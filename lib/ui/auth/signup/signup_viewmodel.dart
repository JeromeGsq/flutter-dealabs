import 'package:redux/redux.dart';
import 'package:flulabs/models/gender.dart';
import 'package:flulabs/models/loading_status.dart';
import 'package:flulabs/models/signup_request.dart';
import 'package:flulabs/redux/app/app_state.dart';
import 'package:flulabs/redux/auth/auth_actions.dart';
import 'package:flulabs/redux/auth/screen.dart';

class SignUpViewModel {
  final LoadingStatus status;
  final String password;
  final String passwordError;
  final String email;
  final String emailError;
  final String retypePassword;
  final String retypePasswordError;
  final Gender gender;
  final Function(String) validateEmail;
  final Function(String) validatePassword;
  final Function(String, String) validatePasswordMatch;
  final Function(Gender) changeGender;
  final Function(SignUpRequest) signUp;

  SignUpViewModel(
      {this.status,
      this.password,
      this.passwordError,
      this.email,
      this.emailError,
      this.retypePassword,
      this.retypePasswordError,
      this.gender,
      this.validateEmail,
      this.validatePassword,
      this.validatePasswordMatch,
      this.changeGender,
      this.signUp});

  static SignUpViewModel fromStore(Store<AppState> store) =>
      new SignUpViewModel(
          status: store.state.authState.loadingStatus,
          password: store.state.authState.password,
          passwordError: store.state.authState.passwordError,
          email: store.state.authState.email,
          emailError: store.state.authState.emailError,
          retypePassword: store.state.authState.retypePassword,
          retypePasswordError: store.state.authState.retypePasswordError,
          gender: store.state.authState.gender,
          validateEmail: (email) =>
              store.dispatch(new ValidateEmailAction(email, Screen.SIGNUP)),
          validatePassword: (password) => store
              .dispatch(new ValidatePasswordAction(password, Screen.SIGNUP)),
          validatePasswordMatch: (password, retypePassword) => store.dispatch(
              new ValidatePasswordMatchAction(
                  password, retypePassword, Screen.SIGNUP)),
          changeGender: (gender) =>
              store.dispatch(new ChangeGenderAction(gender)),
          signUp: (request) =>
              store.dispatch(new ValidateSignUpFieldsAction(request)));
}
