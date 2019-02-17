import 'package:meta/meta.dart';
import 'package:flulabs/models/loading_status.dart';
import 'package:flulabs/redux/auth/screen_state.dart';

@immutable
class ProductState {
  final ScreenState type;
  final LoadingStatus loadingStatus;
  final String password;
  final String passwordError;
  final String email;
  final String emailError;
  final String code;
  final String codeError;

  ProductState(
      {this.type,
      this.loadingStatus,
      this.password,
      this.passwordError,
      this.email,
      this.emailError,
      this.code,
      this.codeError});

  ProductState copyWith({
    ScreenState type,
    LoadingStatus loadingStatus,
    String password,
    String passwordError,
    String retypePassword,
    String retypePasswordError,
    String email,
    String emailError,
    String token,
    String code,
    String codeError,
  }) {
    return new ProductState(
        type: type ?? this.type,
        loadingStatus: loadingStatus ?? this.loadingStatus,
        password: password ?? this.password,
        passwordError: passwordError ?? this.passwordError,
        email: email ?? this.email,
        emailError: emailError ?? this.emailError,
        code: code ?? this.code,
        codeError: codeError ?? this.codeError);
  }

  factory ProductState.initial() {
    return new ProductState(
        type: ScreenState.PRODUCT,
        loadingStatus: LoadingStatus.success,
        password: "",
        passwordError: "",
        email: "",
        emailError: "",
        code: "",
        codeError: "");
  }
}
