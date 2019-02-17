import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flulabs/ui/base/base_state.dart';

import 'package:flulabs/models/loading_status.dart';
import 'package:flulabs/redux/app/app_state.dart';
import 'package:flulabs/utils/strings.dart';

import 'package:flulabs/ui/usercontrols/top_icon_flat_button.dart';
import 'package:flulabs/ui/usercontrols/temperature_counter.dart';

import 'product_viewmodel.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends BaseState<ProductPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SafeArea(
              child: Container(
                color: Colors.grey,
                child: StoreConnector<AppState, ProductViewModel>(
                  builder: (__, viewModel) => content(viewModel, constraints),
                  converter: (store) => ProductViewModel.fromStore(store),
                ),
              ),
            ),
      ),
    );
  }

  Widget content(ProductViewModel viewModel, BoxConstraints constraints) =>
      viewModel.status == LoadingStatus.loading
          // While state is loading
          ? new Center(child: new CircularProgressIndicator())
          // While state is loaded
          : Scaffold(
              body: new Stack(
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(minWidth: constraints.maxWidth),
                            child: Padding(
                              padding: const EdgeInsets.only(),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  image(viewModel),
                                  informations(viewModel),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: double.infinity,
                                    height: 10000,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Positioned(
                      top: 0.0, left: 0.0, right: 0.0, child: header(deal)),
                ],
              ),
            );

  // Top Image
  Widget image(ProductViewModel viewmodel) => Container(
        width: double.infinity,
        height: 205,
        decoration: const BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://static-pepper.dealabs.com/threads/content/c2BMf/1512139.jpg"),
          ),
        ),
      );

  // Informations
  Widget informations(ProductViewModel viewmodel) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TemperatureCounter(0),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Text(
                    "Printemps du Cinéma : Place de cinéma à 4€",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Text(
                    "4€",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.red[700],
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey[300],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () => {},
                color: Colors.blue[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "VOIR DEAL",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Icon(
                        Icons.store,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Save button
                  TopIconFlatButton(
                    "Sauver",
                    Icons.bookmark,
                    pressed: () => {},
                  ),
                  // Follow button
                  TopIconFlatButton(
                    "Suivre",
                    Icons.notifications,
                    pressed: () => {},
                  ),
                  // Share
                  TopIconFlatButton(
                    "Partager",
                    Icons.share,
                    pressed: () => {},
                  ),
                  // Share
                  TopIconFlatButton(
                    "Dernier com.",
                    Icons.file_download,
                    pressed: () => {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

/*

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: RichText(
                      text: TextSpan(
                        text: "Bon plans : ",
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Xbox store",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  */
