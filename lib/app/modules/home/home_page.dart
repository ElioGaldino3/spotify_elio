import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Spotelio"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text('Playlists:'),
          ),
          Expanded(
            child: Observer(builder: (_) {
              return ListView.builder(
                itemCount: controller.playlists.length,
                itemBuilder: (context, index) {
                  var playlist = controller.playlists[index];
                  return ListTile(
                    title: Text(playlist.name),
                    subtitle: Text('por ${playlist.owner.displayName}'),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(playlist.images[1].url)),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
