import 'package:redux/redux.dart';
import 'package:flulabs/models/loading_status.dart';
import 'package:flulabs/redux/app/app_state.dart';

class ProductViewModel {
  final LoadingStatus status;
  final String id;
  final String title;
  final String description;
  final String image;
  final int temperature;

  ProductViewModel({
    this.status,
    this.id,
    this.title,
    this.description,
    this.image,
    this.temperature,
  });

  static ProductViewModel fromStore(Store<AppState> store) =>
      new ProductViewModel(
          status: store.state.productState.loadingStatus,
          id: store.state.productState.id,
          title: store.state.productState.title,
          description: store.state.productState.description,
          image: store.state.productState.image);
}
