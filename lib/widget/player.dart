import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class PlayerWidget extends StatefulWidget {
  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  IjkMediaController _controller = IjkMediaController();
  @override
  void initState() {
    super.initState();
    this.initPlayer();
  }

  initPlayer() async {
    // 直播
    // http://1011.hlsplay.aodianyun.com/demo/game.flv
    // mp4
    // https://media.w3.org/2010/05/sintel/trailer.mp4
    await _controller.setNetworkDataSource(
      'http://1011.hlsplay.aodianyun.com/demo/game.flv',
      autoPlay: true,
    );
    print("set data source success");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // 设置高度
      color: Colors.black,
      alignment: Alignment.center,
      child: _controller.isInit ? Text('加载中...', style: TextStyle(color: Colors.white),) : IjkPlayer(mediaController: _controller),
    );
  }
}
