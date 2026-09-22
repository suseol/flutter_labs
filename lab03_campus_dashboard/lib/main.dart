import 'package:flutter/material.dart';
// 이번 실습은 처음부터 차근차근 앱을 완성해 갑니다.
// 중간에 놓치면 github에서 중간버전을 받아서 진행하도록 하세요
// 아래 코드는 main()에서 수행하기 때문에 Hot Reload가 안됩니다. 
// 실습 중 MaterialApp()을 build()에서 리턴하도록 수정하게 됩니다.

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('캠퍼스 대시보드 앱'),
        ),
      ),
    ),
  );
}
