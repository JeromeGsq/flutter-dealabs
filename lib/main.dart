import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flulabs/redux/app/app_state.dart';
import 'package:flulabs/redux/pages/keys.dart';
import 'ui/product/product_page.dart';
import 'package:flulabs/redux/store.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  var store = await createStore();
  runApp(new App(store));
}

class App extends StatefulWidget {
  final Store<AppState> store;

  App(this.store);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
            brightness: Brightness.dark,
            // ignore: strong_mode_invalid_cast_new_expr
            primaryColor: const Color(0xFF000000),
            accentColor: const Color(0xFF000000),
          ),
          home: ProductPage(),
          navigatorKey: Keys.navKey,
          routes: <String, WidgetBuilder>{
            "/product": (BuildContext context) => new ProductPage(),
          }),
    );
  }
}
