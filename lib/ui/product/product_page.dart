import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flulabs/redux/app/app_state.dart';

import 'package:flulabs/utils/strings.dart';
import 'package:flulabs/utils/colors.dart';

import 'package:flulabs/ui/base/base_state.dart';
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
      resizeToAvoidBottomPadding: false,
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
      Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          child: bottomCommentary(viewModel),
        ),
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
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          image(viewModel),
                          informations(viewModel),
                          Container(
                            width: double.infinity,
                            height: 16,
                            color: Colors.grey[300],
                          ),
                          Container(
                            width: double.infinity,
                            height: 1000,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Vol A/R Paris (CDG) <> Manille (MNL) du 16 au 29 décembre 2019",
                                style: TextStyle(
                                  color: Colors.grey[900],
                                ),
                              ),
                            ),
                          ),
                        ],
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
                "http://fotorelax.ru/wp-content/uploads/2017/04/Beautiful-places-on-the-planet-with-the-beautiful-colors-of-water-00.jpg"),
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
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TemperatureCounter(66),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  new RichText(
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: new TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'Bons plans ',
                            style: new TextStyle(fontWeight: FontWeight.bold)),
                        new TextSpan(
                            text: 'Kayak',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[400])),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Text(
                    "Vol A/R Paris (CDG) <> Manille (MNL) du 16 au 29 décembre 2019",
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Text(
                    "376,99€",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.red[800],
                        fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: avatarPanel(viewmodel),
                  ),
                  Container(
                    height: 0.5,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0, top: 12),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed: () => {},
                      color: pacific_blue,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                "VOIR DEAL",
                                style: TextStyle(fontSize: 14),
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
                    padding: EdgeInsets.only(top: 8, bottom: 8),
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
            ),
            Container(
              color: Colors.grey[400],
              width: double.infinity,
              height: 1,
            ),
          ],
        ),
      );

  // Avatar
  Widget avatarPanel(ProductViewModel viewmodel) => Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        height: 60,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: new Container(
                width: 40.0,
                height: 40.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "https://static-pepper.dealabs.com/users/user_avatar/default/942525_1.jpg"),
                  ),
                ),
              ),
            ),
            new Container(
              width: 8.0,
            ),
            Expanded(
              flex: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "daminou1983",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    "30 avril 12:33",
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: MaterialButton(
                onPressed: () => {},
                child: Icon(
                  Icons.group_add,
                  color: pacific_blue,
                ),
              ),
            ),
          ],
        ),
      );

  // Bottom bar
  Widget bottomCommentary(ProductViewModel viewmodel) => BottomAppBar(
        child: new Container(
          decoration: new BoxDecoration(color: Colors.white, boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ]),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.fullscreen,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "Ajouter un commentaire...",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}
