import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
          // FutureBuilder 와 StreamBuilder 둘 다 제너릭을 설정해줄 수 있다.
          // snapshot.data 에 들어가는 데이터의 타입을 명시해줌
          // builder 에 snapshot의 타입은 AsyncSnapshot 이다. 거기에도 제너릭 동일하게 ㄱㄱ
      child: StreamBuilder<int>(
        stream: streamNumbers(),
        builder: (context, AsyncSnapshot<int> snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'StreamBuilder',
                style: textStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
              Text(
                'ConState : ${snapshot.connectionState}',
                style: textStyle,
              ),
              Row(
                children: [
                  Text(
                    'Data : ${snapshot.data}',
                    style: textStyle,
                  ),
                  if (snapshot.connectionState == ConnectionState.waiting)
                    CircularProgressIndicator(),
                ],
              ),
              Text(
                'Error : ${snapshot.error}',
                style: textStyle,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('setState'),
              )
            ],
          );
        },
      ),
    ));
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(milliseconds: 600));


      if (i == 7) {
        throw Exception('error ... i == 7');
      }

      yield i;
    }
  }
}
