
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseWidgetPage extends StatefulWidget {
  const BaseWidgetPage({super.key});

  @override
  State<StatefulWidget> createState() => _BaseWidgetPage();

}

class _BaseWidgetPage extends State<BaseWidgetPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          TextButton(child: const Text('TextButton'), onPressed: (){
            Fluttertoast.showToast(msg: "TextButton");

          },),
          FloatingActionButton(child: const Icon(Icons.add), onPressed: (){
            Fluttertoast.showToast(msg: "FloatingActionButton");

          },),
          OutlinedButton(child: const Text('OutlinedButton'),onPressed: (){
            Fluttertoast.showToast(msg: "OutlinedButton");
          },),
          getImageWidget(),

        ],
      ),
    );
  }

  getImageWidget() {
    return Image.asset("assets/images/girl.webp", width: 200,height: 300,);
  }

  final AppBar _appBar = AppBar(
    title: const Text('基础组件'),
    elevation: 0,
  );

}