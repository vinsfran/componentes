import 'package:flutter/material.dart';

import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Componentes App',
        debugShowCheckedModeBanner: false,
        // home: HomePage()
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/' : (BuildContext context) => HomePage(),
          'alert' : (BuildContext context) => AlertPage(),
          'avatar' : (BuildContext context) => AvatarPage(),
        },
        );
  }
}
