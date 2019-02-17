import 'package:meta/meta.dart';
import 'package:flulabs/models/loading_status.dart';
import 'package:flulabs/redux/pages/screen_state.dart';

@immutable
class ProductState {
  final ScreenState type;
  final LoadingStatus loadingStatus;
  final String id;
  final String title;
  final String description;
  final String image;
  final String code;
  final String codeError;

  ProductState(
      {this.type,
      this.loadingStatus,
      this.id,
      this.title,
      this.description,
      this.image,
      this.code,
      this.codeError});

  ProductState copyWith({
    ScreenState type,
    LoadingStatus loadingStatus,
    String id,
    String title,
    String description,
    String image,
    String token,
    String code,
    String codeError,
  }) {
    return new ProductState(
        type: type ?? this.type,
        loadingStatus: loadingStatus ?? this.loadingStatus,
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        code: code ?? this.code,
        codeError: codeError ?? this.codeError);
  }

  factory ProductState.initial() {
    return new ProductState(
        type: ScreenState.PRODUCT,
        loadingStatus: LoadingStatus.success,
        id: "",
        title: "",
        description: "",
        image: "",
        code: "",
        codeError: "");
  }
}
