import 'package:flutter/material.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<StatefulWidget> createState() => _ClassPage();

}

class _ClassPage extends State<ClassPage> {
  Person person = Person();
  Student student = Student("小明");
  Teacher teacher = Teacher("张老师");

  @override
  void initState() {
    super.initState();
    person.name = "小红";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text("type: ${person.runtimeType} ${person.traval()}"),
          Text("type: ${student.runtimeType} ${student.traval()}"),
          Text("type: ${teacher.runtimeType} ${teacher.traval()}"),
        ],
      ),
    );
  }

  final AppBar _appBar = AppBar(
    title: const Text('类'),
    elevation: 0,
  );

}

class Person {
  String name = "";
  int age = 0;
  int _height = 0;
  final money = 100;

  /// 出行 步行
  traval() {
    return "name: $name on foot";
  }

}

/// implements 实现所有成员变量(包含：final、private）和方法
class Student implements Person {

  // 构造函数
  Student(this.name): super();

  @override
  int age = 18;

  @override
  int _height = 170;

  @override
  String name = "student";


  /// 如果是 final 类型的也要重写，重新赋值
  @override
  int get money => 101;

  @override
  traval() {
    _height = 169;
    return "name: $name bike";
  }

}

class Teacher extends Person {

  // 构造函数
  Teacher(String teacherName) {
    name = teacherName;
  }

  // get() 方法
  @override
  String get name => "teacher";

  @override
  traval() {
    return  "name: $name car";
  }
}