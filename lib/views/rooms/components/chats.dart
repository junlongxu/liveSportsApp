
import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/status.dart' as status;
// import 'animate.dart' show Gift;
class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List msgData = [];
  List<Map> giftData = [];
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    // SocketClient.create('ws://172.24.135.18:1236/socket/dy/flutter');
    // var channel = SocketClient.chiannel;
    // channel.stream.listen((event) {
    //   event = json.decode(event);
    //   var sign = event[0];
    //   var data = event[1];
    //   if(sign == 'getChat'){
    //     setState(() {
    //       msgData.add(data);
    //     });
    //     _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    //   }else if(sign == 'getGift'){
    //     var now = DateTime.now();
    //     var obj = {
    //       'stamp': now.millisecondsSinceEpoch,
    //       'config': data
    //     };
    //     // Gift.add(giftData, obj, 6500,(giftDataNew){
    //     //   if(mounted)setState(() {
    //     //     giftData = giftDataNew;
    //     //   });
    //     // });
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Chats');
  }
}
