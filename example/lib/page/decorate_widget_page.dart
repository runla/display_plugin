
import 'package:flutter/material.dart';

class DecorateWidgetPage extends StatefulWidget {
  const DecorateWidgetPage({super.key});

  @override
  State<StatefulWidget> createState() => _DecorateWidgetPage();

}

class _DecorateWidgetPage extends State<DecorateWidgetPage> {

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
          getPaddingWidget(),
          getCircleShape(),
          getRectangelShape(),
          getAspectRatioWidget(),
        ],
      ),
    );
  }

  /// 设置内边距和外边距
  getPaddingWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 10,left: 10),
      color: Colors.blue,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        color: Colors.red,
        child: const Text("Mindlinker", style: TextStyle(color: Colors.black),),
      ),
    );
  }

  /// 默认情况下，圆形的直径等于 Container 窄边长度，相当于在矩形内绘制内切圆。
  getCircleShape() {
    return Container(
      margin: const EdgeInsets.only(top: 10,left: 10),
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      child: const Text('Mindlinker', style: TextStyle(color: Colors.black)),
    );
  }

  getRectangelShape() {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(top: 10,left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
      ),
      child: const Text('chenjianrun'),
    );
  }

  getAspectRatioWidget() {
    return Container(
      height: 150,
      width: 150,
      color: Colors.blue,
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 2 / 1,   // 宽高比
        child: Container(color: Colors.red,),
      ),
    );
  }
  final AppBar _appBar = AppBar(
    title: const Text('装饰'),
    elevation: 0,
  );

}