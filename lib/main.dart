import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:liveSportsApp/router/index.dart';

import 'navigator/tab_navigator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  realRunApp();
  try {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(style);
    }
  } catch (err) {
    print(err);
  }
}

void realRunApp() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '直播',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'San Francisco font(SF)',
        primaryColor: Colors.greenAccent,
        highlightColor: Color.fromRGBO(0, 0, 0, 0),
        splashColor: Color.fromRGBO(0, 0, 0, 0),
      ),
      home: Container(
        color: Color(0xff242a37),
        // color: Colors.transparent,
        child: Media(),
      ),
      onGenerateRoute: getRoute,
    );
  }
}

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabNavigator(),
    );
  }
}
