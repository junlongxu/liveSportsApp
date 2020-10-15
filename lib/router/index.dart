import 'package:flutter/material.dart';
import 'package:liveSportsApp/views/rooms/room.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  Map<String, WidgetBuilder> routes = {
    '/': (BuildContext context) => Text('data'),
    '/room': (BuildContext context) => Room(arguments: settings.arguments)
  };

  var widget = routes[settings.name];

  if (widget != null) {
    return MaterialPageRoute(
      settings: settings,
      builder: widget,
    );
  }
  return null;
}
