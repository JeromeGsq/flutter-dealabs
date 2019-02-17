import 'package:meta/meta.dart';
import 'package:flulabs/redux/auth/signin/singin_state.dart';

@immutable
class AppState {
  final ProductState productState;

  AppState({@required this.productState});

  factory AppState.initial() {
    return AppState(productState: ProductState.initial());
  }

  AppState copyWith({
    ProductState signInState,
  }) {
    return AppState(productState: signInState ?? this.productState);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          productState == other.productState;

  @override
  int get hashCode => productState.hashCode;
}
