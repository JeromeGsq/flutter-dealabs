import 'package:flulabs/redux/app/app_state.dart';
import 'package:flulabs/redux/pages/product/product_reducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    new AppState(productState: productReducer(state.productState, action));
