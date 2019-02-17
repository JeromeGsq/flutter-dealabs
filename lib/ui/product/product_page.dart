import 'package:flutter/material.dart';
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
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SafeArea(
              child: Container(
                color: Colors.grey,
                child: StoreConnector<AppState, ProductViewModel>(
                  builder: (_, viewModel) => content(viewModel, constraints),
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
          : Container(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  header(deal),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );

  // Top Image
  Widget image(ProductViewModel viewmodel) => Image.network(
        "https://cdn.pixabay.com/photo/2016/06/18/17/42/image-1465348_960_720.jpg",
      );

  // Informations
  Widget informations(ProductViewModel viewmodel) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new TemperatureCounter(0),
                  new Text(
                    "Bons plans Xbox Store",
                    style: TextStyle(color: Colors.black),
                  ),
                  new Text(
                    "[Gold] NBA 2K19 jouable gratuitement sur Xbox One",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
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
