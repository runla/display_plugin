import 'package:display_plugin_example/page/class_page.dart';
import 'package:flutter/material.dart';

class AsyncPage extends StatefulWidget {
  const AsyncPage({super.key});

  @override
  State<StatefulWidget> createState() => _AsyncPage();

}

class _AsyncPage extends State<AsyncPage> {

  String displayUserInfoStep = "";
  String _HelloWorld = "";


  login(String name, String password) async {
    String accessToken = "accessToken";
    return Future.delayed(const Duration(seconds: 1), () {
      return accessToken;
    });
  }

  getUserInfo(String accessToken) async {
    return Future.delayed(const Duration(seconds: 1), () {
      return Student("chenjianrun");
    });
  }

  displayUserInfo() {
    updateDisplayUserInfoStep("login before");
    // Step 1. 登录
    login("chenjianrun", "123456")
        .whenComplete(() {
          updateDisplayUserInfoStep("login complete");
        })
        .then((accessToken){
          updateDisplayUserInfoStep("login after");
          updateDisplayUserInfoStep("getUserInfo before");

          // Step 2. 获取用户信息
          return getUserInfo(accessToken);
        })
        .then((student) {
          // Step 3. 拿到用户信息，进行处理
          updateDisplayUserInfoStep("getUserInfo after");
        }).whenComplete(() {
          updateDisplayUserInfoStep("getUserInfo complete");
    });

  }

  updateDisplayUserInfoStep(String step) {
    debugPrint(step);
    setState(() {
      displayUserInfoStep = step;
    });
  }


  displayHelloWorld() {
    Future.wait([
      // 2秒后返回结果
      Future.delayed( const Duration(seconds: 2), () {
        return "hello";
      }),
      // 4秒后返回结果
      Future.delayed( const Duration(seconds: 4), () {
        return " world";
      })
    ]).then((results) {
      //执行成功会走到这里
      setState(() {
        _HelloWorld = results[0] + results[1];
        debugPrint(_HelloWorld);
      });
    }).catchError((e){
      //执行失败会走到这里
      debugPrint(e);
    }).whenComplete((){
      //无论成功或失败都会走到这里
    });
  }

  @override
  void initState() {
    super.initState();
    displayUserInfo();
    displayHelloWorld();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text(displayUserInfoStep),
          Text(_HelloWorld),
        ],
      ),
    );
  }


  final AppBar _appBar = AppBar(
    title: const Text('异步任务'),
    elevation: 0,
  );

}