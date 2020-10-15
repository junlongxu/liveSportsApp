import 'package:flutter/material.dart';
import 'package:liveSportsApp/utils/base.dart';
import 'package:liveSportsApp/widget/fresh_header_widget.dart';

// 我的
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with Base {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: FreshHeaderWidget(),
      ),
    );
  }
}
