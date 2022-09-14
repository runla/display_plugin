
import 'package:flutter/material.dart';

class LayoutWidgetPage extends StatefulWidget {
  const LayoutWidgetPage({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutWidgetPage();

}

class _LayoutWidgetPage extends State<LayoutWidgetPage> {

  @override
  void initState() {
    super.initState();
    Navigator.pop(context,);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴
        children: <Widget> [
          getRowWidget(),
          const SizedBox(height: 10,),
          getColumnWidget(),
          Row(
            children: <Widget> [
              getStackWidget(),
              getStackWidgetAlignCenter(),
            ],
          ),
          getPositionWidget(),
          getColumnFlexibelWidget(),
        ],
      ),
    );
  }

  /// 水平布局
  /// 主轴：水平方向
  /// 交叉轴：垂直方向
  getRowWidget() {
    return Container(
      height: 100,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴：垂直方向
        mainAxisAlignment: MainAxisAlignment.center,  // 主轴：水平方向
        children: <Widget>[
          Container(
            height: 50,
            width: 100,
            color: Colors.red,
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.green,
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }


  /// 垂直布局
  /// 主轴：垂直方向
  /// 交叉轴：水平方向
  getColumnWidget() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            width: 100,
            color: Colors.red,
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.green,
          ),
          Container(
            height: 50,
            width: 100,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }


  getStackWidget() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
          Container(
            height: 85,
            width: 85,
            color: Colors.blue,
          ),
          Container(
            height: 70,
            width: 70,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }

  getStackWidgetAlignCenter() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
          Container(
            height: 85,
            width: 85,
            color: Colors.blue,
          ),
          Container(
            height: 70,
            width: 70,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }

  getPositionWidget() {
    return Stack(
      clipBehavior: Clip.none,  // 不做裁剪
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
        Positioned(
          left: 50,
          top: 50,
          height: 75,
          width: 75,
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );

  }


  getColumnFlexibelWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      height: 150,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text('1 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text('2 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text('3 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }

  final AppBar _appBar = AppBar(
    title: const Text('布局组件'),
    elevation: 0,
  );

}