import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:spotify_elio/app/modules/auth/auth_controller.dart';
import 'package:spotify_elio/app/shared/enums/auth_enum.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, AuthController> {
   ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) async {
      if (controller.authStatus == AuthStatus.LOGOUT) {
        Modular.to.pushReplacementNamed('/login');
      } else if (controller.authStatus == AuthStatus.LOGGED) {
        Modular.to.pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/logos/spotify_logo.png',
          width: screenWidth * .4,
        ),
      ),
    );
  }
}
