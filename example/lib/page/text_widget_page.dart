
import 'package:flutter/material.dart';

class TextWidgetPage extends StatefulWidget {
  const TextWidgetPage({super.key});

  @override
  State<StatefulWidget> createState() => _TextWidgetPage();

}

class _TextWidgetPage extends State<TextWidgetPage> {

  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textFieldController.text = "";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: _appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                // 监听文本变化
              },
              decoration: const InputDecoration(
                fillColor: Color(0xffcccccc),
                hintText: '请输入昵称',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffcccccc)),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),

              controller: textFieldController,
            ),
          ),
          const Text('Mindlnker'),
          // TextStyle: 字体颜色、字体大小、字体加粗
          const Text('Mindlnker',style: TextStyle(color: Colors.red,fontSize: 20),),
          const Text('Mindlnker',style: TextStyle(fontWeight: FontWeight.w100)),
          const Text('Mindlnker',style: TextStyle(fontWeight: FontWeight.w200)),
          const Text('Mindlnker',style: TextStyle(fontWeight: FontWeight.w300)),
          const Text('Mindlnker',style: TextStyle(fontWeight: FontWeight.w400)),
          const Text('Mindlnker',style: TextStyle(fontWeight: FontWeight.w500)),
          const Text('Mindlnker',style: TextStyle(fontWeight: FontWeight.w600)),
          const Text('Mindlnker',style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            width: 50,
            color: Colors.blue.withOpacity(.4),
            child: const Text('Mindlnker ',overflow: TextOverflow.ellipsis),
          ),
          RichText(
            text: const TextSpan(
                children: <InlineSpan>[
                  TextSpan(text: '迈聆',style: TextStyle(color: Colors.red)),
                  TextSpan(text: '，', style: TextStyle(color: Colors.black)),
                  TextSpan(text: '大卖', style: TextStyle(color: Colors.blue)),
                ]),
          ),



        ],
      ),
    );
  }


  final AppBar _appBar = AppBar(
    title: const Text('文本组件'),
    elevation: 0,
  );

  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
  }
}