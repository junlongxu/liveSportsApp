import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liveSportsApp/utils/base.dart';
import 'package:liveSportsApp/widget/player.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
import 'dart:async';

import 'components/chats.dart';

class Room extends StatefulWidget {
  final arguments;
  Room({Key key, this.arguments}) : super(key: key);
  @override
  _RoomState createState() => _RoomState(arguments);
}

class _RoomState extends State<Room> with Base {
  Timer timerCloseSVGA;
  final _arguments;
  _RoomState(this._arguments);
  // 新建
  @override
  void initState() {
    timerCloseSVGA = Timer(Duration(milliseconds: 7600), () {
      setState(() {
        timerCloseSVGA = null;
      });
    });
    super.initState();
  }

  // 销毁
  @override
  void dispose() {
    timerCloseSVGA?.cancel();
    // if (timerCloseSVGA != null) {
    // }
    super.dispose();
  }

  // build
  @override
  Widget build(BuildContext context) {
    print(padding);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      key: ValueKey('light'),
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  //状态栏高度
                  height: padding.top,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // begin: Alignment.topCenter,
                      // end: Alignment.bottomCenter,
                      colors: [Colors.cyan, Colors.deepOrange],
                    ),
                  ),
                ),
                PlayerWidget(),
                _nav,
                Chats(),
              ],
            ),
            timerCloseSVGA != null
                ? Container(
                    child: SVGASimpleImage(
                      resUrl: 'static/angel.svga',
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  Row get _nav => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 40,
            padding: EdgeInsets.only(top: 10),
            width: 60,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: defaultColor,
                  width: 3,
                ),
              ),
            ),
            child: Text(
              '弹幕',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.only(top: 10),
            width: 60,
            child: Text(
              '主播',
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
}
