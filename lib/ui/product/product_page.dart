import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flulabs/models/loading_status.dart';
import 'package:flulabs/redux/app/app_state.dart';
import 'product_viewmodel.dart';
import 'package:flulabs/utils/strings.dart';
import 'package:flulabs/utils/colors.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (context, constraints) => SafeArea(
                child: Container(
                  color: Colors.black,
                  child: StoreConnector<AppState, ProductViewModel>(
                      builder: (_, viewModel) =>
                          content(viewModel, constraints),
                      converter: (store) => ProductViewModel.fromStore(store)),
                ),
              )),
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
                  header(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: constraints.maxWidth),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );

  Widget header() => Padding(
        padding: const EdgeInsets.only(left: 21.0, top: 21.0),
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.0, bottom: 4.0),
              child: new Text(
                deal,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
}
