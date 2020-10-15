import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveSportsApp/utils/base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// 下拉刷新头部、底部组件
class FreshHeaderWidget extends StatelessWidget with Base {
  final Widget child;
  final List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  FreshHeaderWidget({this.child,});
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    // if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(
          waterDropColor: defaultColor,
          refresh: SizedBox(
            width: 25.0,
            height: 25.0,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(defaultColor),
            ),
          ),
          complete: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.insert_emoticon,
                color: defaultColor,
              ),
              Container(
                width: 15.0,
              ),
              Text(
                '更新好啦~',
                style: TextStyle(color: defaultColor),
              )
            ],
          ),
          idleIcon: Icon(
            Icons.favorite,
            size: 14.0,
            color: Colors.white,
          ),
        ),
        // 底部加载
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载", style: TextStyle(color: defaultColor));
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！", style: TextStyle(color: defaultColor));
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多!", style: TextStyle(color: defaultColor));
            } else {
              body = Text("没有更多数据了!", style: TextStyle(color: defaultColor));
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child:  child != null ? child :
        ListView.builder(
          itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
          itemExtent: 100.0,
          itemCount: items.length,
        ),
      ),
    );
  }
}
