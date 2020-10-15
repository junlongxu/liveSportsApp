import 'package:flutter/material.dart';
import 'package:liveSportsApp/pages/discoverypage/index.dart';
import 'package:liveSportsApp/pages/livepage/index.dart';
import 'package:liveSportsApp/pages/mypage/index.dart';
import 'package:liveSportsApp/pages/predictionpage/index.dart';
import 'package:liveSportsApp/pages/schedulepage/index.dart';
import 'package:liveSportsApp/utils/base.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> with Base {
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  final List<dynamic> pages = [
    LivePage(),
    SchedulePage(),
    DiscoveryPage(),
    PredictionPage(),
    MyPage()
  ];
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return Container(
      color: Color(0xffebf5fd),
      padding: EdgeInsets.only(
        top: padding.top,
        bottom: padding.bottom,
      ),
      child: _scaffold,
    );
  }

  Widget get _scaffold => Scaffold(
        backgroundColor: bgColor,
        body: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[...pages],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Color(0xffffffff),
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            _svgWidget('home', '直播', 0, Icons.live_tv),
            _svgWidget('community', '赛程', 1,Icons.access_alarms),
            _svgWidget('camera', '发现', 2, Icons.visibility),
            _svgWidget('task', '预测', 3,Icons.fingerprint),
            _svgWidget('my', '我的', 4,Icons.send)
          ],
        ),
      );

  BottomNavigationBarItem _svgWidget(String img, String title, int index, IconData  icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(
        title,
        // style: TextStyle(
        //   foreground: _currentIndex != index
        //       ? (Paint()
        //         ..shader = textGradient(Color(0xff000000), Color(0xff000000)))
        //       : (Paint()
        //         ..shader = textGradient(Color(0xff59b3ff), Color(0xff45aaff))),
        //   decoration: TextDecoration.none,
        // ),
      ),
    );
  }
}
