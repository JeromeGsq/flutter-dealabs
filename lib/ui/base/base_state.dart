import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title});

  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Actualiser'),
  const Choice(title: 'Partager'),
  const Choice(title: 'Sauver pour plus tard'),
  const Choice(title: 'Suivre'),
  const Choice(title: 'Signaler l\'expiration'),
  const Choice(title: 'Signaler'),
  const Choice(title: 'Ajouter une information'),
  const Choice(title: 'Ouvrir dans le navigateur'),
];

class BaseState<T> extends State {
  // Top navigation bar
  Widget header(String title) => AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            itemBuilder: (BuildContext context) {
              return choices.skip(2).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
