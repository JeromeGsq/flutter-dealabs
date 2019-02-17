import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flulabs/ui/base/base_state.dart';

import 'package:flulabs/models/loading_status.dart';
import 'package:flulabs/redux/app/app_state.dart';
import 'package:flulabs/utils/strings.dart';

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
            new Text(
              "- 30 +",
              style: TextStyle(color: Colors.black),
            ),
            new Text(
              "Bons plans Xbox Store",
              style: TextStyle(color: Colors.black),
            ),
            new Text(
              "[Gold] NBA 2K19 jouable gratuitement sur Xbox One",
              style: TextStyle(color: Colors.black),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Save button
                FlatButton(
                  onPressed: () => {},
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.bookmark,
                        color: Colors.grey,
                      ),
                      Text(
                        "Sauver",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                // Follow
                FlatButton(
                  onPressed: () => {},
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.notifications,
                        color: Colors.grey,
                      ),
                      Text(
                        "Suivre",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                // Share
                FlatButton(
                  onPressed: () => {},
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.grey,
                      ),
                      Text(
                        "Partager",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                // Last comment
                FlatButton(
                  onPressed: () => {},
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.file_download,
                        color: Colors.grey,
                      ),
                      Text(
                        "Dernier com.",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
