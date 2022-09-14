

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FunctionPage extends StatefulWidget {
  const FunctionPage({super.key});

  @override
  State<StatefulWidget> createState() => _FunctionPage();

}

class _FunctionPage extends State<FunctionPage> {
  final String boyHeaderUrl = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202005%2F02%2F20200502185802_FuFU2.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665392534&t=377349eedfe5414f5dfd05202748d74a";
  final String girlHeaderUrl = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202010%2F23%2F20201023204811_87c9c.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665392642&t=0d3538edd62804aaab062591747368b6";
  String meetingNo = "";
  String nickName = "";
  String avatar = "" ;
  String password = "";
  String? topic;

  @override
  void initState() {
    super.initState();
    debugPrint("hasAvatar=${hasAvatar()}");
    debugPrint("emptyFuntion=${emptyFuntion()}");
    debugPrint("getNickname=${getNickname()}");
    debugPrint("asyncFun=${asyncFun()}");
  }

  Widget displayAvatarWidget() {
    dynamic imageWidget =  avatar.isEmpty
        ? const AssetImage("assets/images/default_avatar.webp")
        : NetworkImage(avatar);

    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: imageWidget, fit: BoxFit.cover)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          displayAvatarWidget(),
          Text("meetingNo: $meetingNo"),
          Text("nickName: $nickName"),
          Text("password: $password"),
          Text("topic: ${topic ?? "无标题"}"),
          Row(
            children: <Widget> [
              TextButton(onPressed: (){
                // createMeeting("123456789", "chenjianrun", boyHeaderUrl, (meetingNo) {
                //
                // });

                createMeeting("123456789", "chenjianrun", boyHeaderUrl, createMeetingCallback);

              }, child: const Text("创建会议")),

              TextButton(onPressed: (){
                // avatar 是必选的
                // 名称参数可选，位置随意
                String joinTopic = "静静的会议室";
                joinMeeting("987654321", "jingjing", topic: joinTopic, avatar: girlHeaderUrl, callback: (meetingNo) {

                });
              }, child: const Text("加入会议")),


            ],
          )
        ],
      ),
    );
  }

  /// 空返回是 null
  emptyFuntion() {

  }

  /// 默认返回：Future<void>，即使我什么都没有做
  Future<void> asyncFun() async {

  }

  /// 可以不用明确指明返回类型
  hasAvatar() {
    return avatar.isNotEmpty;
  }

  /// 类型推断
  getNickname() => nickName;

  var createMeetingCallback = (String meetingNo) {
    Fluttertoast.showToast(msg: "createMeeting meetingNo: $meetingNo");
  };

  /// 加入会议
  /// 可选参数，如果是不可空类型的必须要有初始值.
  /// 如果要填 topic，那么 password 是必选的
  createMeeting(
      String meetingNo, String nickName, String avatar, Function(String meetingNo)? callback,
      [String password = "", String? topic]) {

    // 延时回调
    Future.delayed(const Duration(seconds: 2),() {
      callback?.call(meetingNo);
      setState(() {
        this.meetingNo = meetingNo;
        this.nickName = nickName;
        this.avatar = avatar;
        this.password = password;
        this.topic = topic ?? nickName;
      });
    });


  }


  /// 加入会议
  ///
  /// 可选参数，如果是不可空类型的必须要有初始值. 1. 设置默认值 2. 添加 required 关键字
  /// avatar 是必选的
  /// 名称参数可选，位置随意
  joinMeeting(
      String meetingNo, String nickName,
      {required String avatar, String password = "", String? topic, MeetingCreateCallback? callback}) {


    // 延时回调
    Future.delayed(const Duration(seconds: 2),() {
      callback?.call(meetingNo);
      setState(() {
        this.meetingNo = meetingNo;
        this.nickName = nickName;
        this.avatar = avatar;
        this.password = password.isEmpty ? "无输入密码" : password;
        this.topic = topic ?? nickName;  // topic 如果是空的，则设置为 nickname
      });
    });



  }


  final AppBar _appBar = AppBar(
    title: const Text('函数'),
    elevation: 0,
  );

}

typedef MeetingCreateCallback = void Function(String meetingNo);