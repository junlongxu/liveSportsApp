import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String defaultText;
  final String hint; // 提示输入框文字
  final Function onChanged;
  final Function callback;
  const InputWidget(
      {this.defaultText = '',
      this.hint = 'U球直播',
      this.onChanged,
      this.callback});

  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool showClear = false;
  FocusNode _commentFocus = FocusNode(); // 获取焦点
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    setState(() {
      _controller.text = widget.defaultText;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        focusNode: _commentFocus,
        controller: _controller,
        onChanged: _onChanged,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        // 输入的文本样式
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          border: InputBorder.none,
          hintText: widget.hint ?? '',
          isDense: true,
          hintStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  _onChanged(String val) {
    if (val.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(val);
    }
  }
}
