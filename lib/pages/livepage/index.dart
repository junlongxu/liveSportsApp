import 'package:flutter/material.dart';
import 'package:liveSportsApp/utils/base.dart';
import 'package:liveSportsApp/widget/fresh_header_widget.dart';
import 'package:liveSportsApp/widget/grid_view_widget.dart';
import 'package:liveSportsApp/widget/input_widget.dart';
import 'package:liveSportsApp/widget/swiper_widget.dart';

// 直播
class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage>
    with SingleTickerProviderStateMixin, Base {
  final List<String> tabList = ['热门', '足球', '篮球', '其他'];
  // ScrollController _scrollController = ScrollController(); // 2个List滚动
  TabController _tabController;

  // 页面重绘
  @override
  void initState() {
    _tabController =
        new TabController(length: tabList.length, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_flexInput, _tabBarLabel, _tabPageView],
    );
  }

  // 输入框和logo
  Flex get _flexInput => Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Image.network(
                'https://mcdn.qiuhui.com/img/logo@2x.2ed78cd5.png',
                width: 80,
                height: 30,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: InputWidget(
              callback: () {
                // NavigatorUtil.pushCuper(
                //   context,
                //   Scaffold(
                //     body: Text('data'),
                //   ),
                // );
              },
            ),
          ),
        ],
      );

  // 顶部导航
  Container get _tabBarLabel => Container(
        alignment: Alignment.topLeft,
        // color: Colors.white,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xff4AB9FE),
          indicatorWeight: 3.0,
          isScrollable: true,
          labelColor: Color(0xff4AB9FE),
          indicatorSize: TabBarIndicatorSize.label,
          // labelPadding: EdgeInsets.fromLTRB(20, 0, 10, 5),
          unselectedLabelColor: Colors.black,
          tabs: <Widget>[
            ...tabList.map<Tab>(
              (tab) => Tab(
                child: Text(
                  tab,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      );
  // 页面
  Expanded get _tabPageView => Expanded(
        child: TabBarView(
          physics: new NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: tabList
              .map<MediaQuery>(
                (value) => MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: _tabView(value),
                ),
              )
              .toList(),
        ),
      );
  Widget _tabView(String name) {
    var listImgs = [
      'https://sta.cranemarsh.com/file/live/room/cover/383994.jpg?t=1602161631',
      'https://sta.cranemarsh.com/file/live/room/cover/156481.jpg?t=1602161631',
      'https://sta.cranemarsh.com/file/live/room/cover/220739.jpg?t=1602161631',
      'https://sta.cranemarsh.com/file/live/room/cover/190114.jpg?t=1602161631',
    ];
    var listImgs1 = [
      'https://sta.cranemarsh.com/file/live/room/cover/147529.jpg?t=1602161631',
      'https://sta.cranemarsh.com/file/live/room/cover/183831.jpg?t=1602161631',
      'https://sta.cranemarsh.com/file/live/room/cover/190114.jpg?t=1602161631',
      'https://sta.cranemarsh.com/file/live/room/cover/147529.jpg?t=1602161631',
    ];
    var bannerList = [
      'https://sta.cranemarsh.com/file/common/20201003/c256bbeed913c78a7b36772785053f1d',
      'https://sta.cranemarsh.com/file/common/20201003/c838682b00529b820f6dc5acad1cbe1f',
      'https://sta.cranemarsh.com/file/common/20201003/91dec45937bfe4276e663ba62679c7f3',
      'https://sta.cranemarsh.com/file/common/20201003/c256bbeed913c78a7b36772785053f1d',
      'https://sta.cranemarsh.com/file/common/20201003/c838682b00529b820f6dc5acad1cbe1f',
      'https://sta.cranemarsh.com/file/common/20201003/91dec45937bfe4276e663ba62679c7f3',
    ];

    Widget page;
    if (name == '热门') {
      page = FreshHeaderWidget(
        child: ListView(
          // controller: _scrollController,
          physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()), // 滚动
          children: <Widget>[
            // 轮播图
            Container(
              margin: EdgeInsets.only(top: 4),
              child: SwiperWidget(bannerList: bannerList),
            ),

            // 横向滑动列表
            FractionallySizedBox(
              widthFactor: 1,
              child: _scrollViewX,
            ),
            // 推荐直播
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('推荐直播', style: TextStyle(fontWeight: FontWeight.w600)),
                  Text('更多',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            GridViewWidget(
              gridList: listImgs,
              callback: _imgItem,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            // 正在热播
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('正在热播', style: TextStyle(fontWeight: FontWeight.w600)),
                  Text('查看',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            GridViewWidget(
              gridList: listImgs1,
              callback: _imgItem,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ],
        ),
      );
    } else if (name == '足球') {
      page = Text('足球');
    } else if (name == '篮球') {
      page = Text('篮球');
    } else if (name == '其他') {
      page = Text('其他');
    }
    return page;
  }

  Widget _imgItem(String imgUrl) {
    return  PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/room', arguments: imgUrl);
        },
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 80, left: 6, right: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '芒果解说',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        '123456',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 4, left: 4),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '南通志云VS长春亚泰',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      // width: 100,
                      height: 15,
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      decoration: new BoxDecoration(
                        color: Color(0xFFf5f5f5), // 底色
                        borderRadius: BorderRadius.circular(10), // 也可控件一边圆角大小
                      ),
                      child: Text(
                        '中超B组第12轮',
                        style:
                            TextStyle(color: Color(0xffa2a2a2), fontSize: 10),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  var lists = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 1, 2, 11];
  // 横向滚动列表
  LayoutBuilder get _scrollViewX => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: 100,
              ),
              color: Colors.white,
              child: Row(children: <Widget>[
                ...lists.map(
                  (val) => Container(
                    width: 100,
                    height: 80,
                    margin: EdgeInsets.only(right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '国际友谊',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            Text(
                              '今天21:00',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  'https://sta.cranemarsh.com/file/common/20201007/6cfda54c8d75119de1cb5ff1843de143',
                                  width: 16,
                                  height: 16,
                                ),
                                Text('丹麦U17',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            Text(val.toString(),
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  'https://sta.cranemarsh.com/file/imgs/team/t1030.gif',
                                  width: 14,
                                  height: 14,
                                ),
                                Text('安养人参',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            Text(val.toString(),
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]
                  // <Widget>[

                  // ],
                  ),
            ),
          );
        },
      );

  // ListView(
  //       // This next line does the trick.
  //       // shrinkWrap: true,
  //       // physics: NeverScrollableScrollPhysics(),
  //       scrollDirection: Axis.horizontal,
  //       children: <Widget>[
  //         Container(
  //           width: 160.0,
  //           color: Colors.red,
  //         ),
  //         Container(
  //           width: 160.0,
  //           color: Colors.blue,
  //         ),
  //         Container(
  //           width: 160.0,
  //           color: Colors.green,
  //         ),
  //         Container(
  //           width: 160.0,
  //           color: Colors.yellow,
  //         ),
  //         Container(
  //           width: 160.0,
  //           color: Colors.orange,
  //         ),
  //       ],
  //     );
}
