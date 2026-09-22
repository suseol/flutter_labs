import 'package:flutter/material.dart';
// 캠퍼스 대시보드의 (1)헤더 부분 완성 코드
void main(){
  runApp(const MyApp()) ;
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ClipRRect( //자식 위젯의 모서리를 둥글게 처리
              borderRadius: BorderRadius.circular(24),
              child: SizedBox(
                width: double.infinity,
                height: 190,
                child: Stack( //여러 위젯을 겹쳐서 배치
                  fit: StackFit.expand, // 자식들이 전체 영역을 차지하도록
                  children: [

                    // Stack 1 맨 아래 이미지
                    Image.asset(
                      'assets/images/lounge.png',
                      // 비율을 유지하면서 영역을 빈틈없이 채운다.
                      // 양쪽에 공간이 남아 있다면 이미지를 키워서 채움. 대신 위아래가 잘림
                      fit: BoxFit.cover,
                    ),

                    // Stack 2 Text 아래에 그라데이션 배경 넣기
                    const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x22000000),
                              Color(0xB3000000),
                            ],
                          ),
                        )
                    ),

                    // Stack 3 제목과 설명 Text
                    const Positioned(
                      left: 20,
                      right: 20,
                      bottom: 20, //top이 없으면 아래에 20px 띄운 지점에 배치
                      child: Column(
                        // mainAxisSize: MainAxisSize.min, //컬럼 크기를 자식들에게 필요한 만큼만 세로 공간을 차지
                        crossAxisAlignment: CrossAxisAlignment.start, // 컬럼 내부에서 자식 배치(정렬) 방향
                        children: [
                          Text(
                            'Campus Explorer',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text(
                            '오늘 이용할 캠퍼스 공간을 찾아보세요.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
