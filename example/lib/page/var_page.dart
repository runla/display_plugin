
import 'package:flutter/material.dart';

class VarPage extends StatefulWidget {
  const VarPage({super.key});

  @override
  State<StatefulWidget> createState() => _VarPage();

}

class _VarPage extends State<VarPage> {
  // 声明一个不定类型的变量。第一次赋值时，该变量类型就被确定，再次被赋值时就会报错
  var name = "chenjianrun";

  // 下划线开始，表示这个变量是 private
  var _age = 18;

  // 类型不定
  dynamic boy = true;

  // final 运行时确定初始值
  final int height = 180;

  // const 编译时确定初始值
  static const int width = 100;

  @override
  void initState() {
    super.initState();
  }

  updateAge() {
    // 修改年龄
    setState(() {
      _age += 1;
    });
  }

  updateBoy() {
    setState(() {
      boy = boy == 1 ? true: 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text("name: $name"),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Text("age: $_age"),
                TextButton(
                    onPressed: () {
                      updateAge();
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        minimumSize: MaterialStateProperty.all(const Size(20, 20)),
                        backgroundColor: MaterialStateProperty.all(Colors.black12),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0)),
                    child: const Text(
                      "+",
                      style: TextStyle(color: Colors.blueAccent),
                    )),

              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Text("boy: $boy"),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: TextButton(
                      onPressed: () {
                        updateBoy();
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          minimumSize: MaterialStateProperty.all(const Size(60, 20)),
                          backgroundColor: MaterialStateProperty.all(Colors.black12),
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0)),
                      child: const Text(
                        "change",
                        style: TextStyle(color: Colors.blueAccent),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  final AppBar _appBar = AppBar(
    title: const Text('变量'),
    elevation: 0,
  );

}