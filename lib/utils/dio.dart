import 'package:dio/dio.dart';
import 'dart:convert';
// import 'package:web_socket_channel/io.dart';

class BaseUrl {
  // uat环境
  // static const String url = 'http://www.11wy.top/api/app/';

  //开发环境
  static const String url = 'http://172.24.135.209:8011/app/';

  //测试环境
  // static const String url = "http://172.24.135.204:8011/app/";

}

// ignore: non_constant_identifier_names
Future DioHttp(
    {String url,
    String method,
    Map<String, dynamic> data,
    Map<String, dynamic> headers}) async {
  if (url.isEmpty) return;
  String apiUrl;
  Response response;
  if (!url.startsWith('http')) {
    apiUrl = '${BaseUrl.url}$url';
  }
  try {
    Map<String, dynamic> dataMap = data == null ? new Map() : data;
    Map<String, dynamic> headersMap = headers == null ? new Map() : headers;
    Dio dio = new Dio();
    dio.options.connectTimeout = 10000; // 服务器链接超时，毫秒
    dio.options.receiveTimeout = 3000; // 响应流上前后两次接受到数据的间隔，毫秒
    dio.options.headers.addAll(headersMap); // 添加headers,如需设置统一的headers信息也可在此添加
    // dio.options.headers['Authorization'] = SpUtil.prefs.getString('token');

    // 数据拼接
    if (dataMap != null && dataMap.keys.length != 0) {
      StringBuffer options = new StringBuffer('?');
      dataMap.forEach((key, value) {
        options.write('$key=$value&');
      });
      String optionsStr = options.toString();
      optionsStr = optionsStr.substring(0, optionsStr.length - 1);
      apiUrl += optionsStr;
    }
    if (method == 'get') {
      response = await dio.get(apiUrl);
    } else if (method == 'post') {
      response = await dio.post(apiUrl);
    }

    if (response.statusCode != 200) {
      return null;
    } else {
      Map<String, dynamic> resDataMap = response.data;
      String _msg = resDataMap['msg'];
      int _code = resDataMap['code'];
      Map _resData = resDataMap['data'];

      if (_code != 200) {
        if (_code == 500) {
          return _msg;
        } else if (_code == 999) {
          return _msg; // 网络异常
        } else if (_code == 401) {
          // SpUtil.prefs.clear();
        }
      } else {
        Utf8Decoder utf8decoder = Utf8Decoder();
        // return jsonDecode(_resData.toString());
        return _resData;
      }
    }
  } catch (err) {
    return '数据请求错误${err.toString}';
  }
}

// class SocketClient {
//   static IOWebSocketChannel chiannel;

//   SocketClient.create(url) {
//     Map<String, dynamic> headers = new Map();
//     headers['origin'] = 'https://x.xx.com';
//     SocketClient.chiannel = IOWebSocketChannel.connect(url, headers: headers);
//   }
// }
