import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer timer;

  //Dùng initeState() để set timer cho setState, làm mới trạng thái mỗi 1s
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    //Hủy timer khi widget bị hủy để tránh trường hợp rò ri bộ nhớ
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(width: 200, height: 200),
          Center(
            child: Text(
                '${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}'),
          ),
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
