import 'package:redux/redux.dart';
import 'package:flulabs/models/loading_status.dart';
import 'package:flulabs/redux/app/app_state.dart';

class ProductViewModel {
  final LoadingStatus status;
  final String password;
  final String passwordError;
  final String email;
  final String emailError;
  final String retypePassword;
  final String retypePasswordError;
  final Function(String) validateEmail;
  final Function(String) validatePassword;
  final Function(String, String) validatePasswordMatch;

  ProductViewModel({
    this.status,
    this.password,
    this.passwordError,
    this.email,
    this.emailError,
    this.retypePassword,
    this.retypePasswordError,
    this.validateEmail,
    this.validatePassword,
    this.validatePasswordMatch,
  });

  static ProductViewModel fromStore(Store<AppState> store) =>
      new ProductViewModel(
          status: store.state.productState.loadingStatus,
          password: store.state.productState.password,
          passwordError: store.state.productState.passwordError,
          email: store.state.productState.email,
          emailError: store.state.productState.emailError);
}
