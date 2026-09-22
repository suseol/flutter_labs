import 'package:flutter/material.dart';
// 캠퍼스 대시보드 (1)헤더 (2)인트로 (3)시설정보 part1 완성 (마지막은 코드 리패토링)
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
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch, // 자식들을 가로 전체 폭으로 확장. 이미 전체를 차지하면 효과는 없음
            children: [
              _buildHeader(),
              _buildIntro(),

              // 여기서부터 시설 카드 실습을 시작
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    height: 164,
                    child: Row(
                      children: [
                        // Image 영역 전체를 SizedBox로 가로 길이를 지정할 수도 있음.
                        Image.asset(
                          'assets/images/lab.png',
                          width: 124,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'AI 실습실', //'AI 융합 소프트웨어 프로젝트 실습 스튜디오',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.chevron_right),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '개인 실습과 팀 프로젝트를 진행할 수 있는 컴퓨터 실습 공간입니다. 최신 장비와 협업 환경도 제공합니다.',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF5F6368),
                                    height: 1.4,
                                  ),
                                ),
                                const Spacer(), //남는 공간을 빈 공간으로
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F0FE),
                                    borderRadius: BorderRadius.circular(999), //최대한 둥글게
                                  ),
                                  child: const Text(
                                      '학습',
                                      style: TextStyle(
                                        color: Color(0xFF174EA6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600, // w100~w900, bold는 w700임
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
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
    );
  }

  Widget _buildIntro() {
    return const Padding(
      // padding: EdgeInsets.all(8.0), //전체 동일
      // EdgeInsets.symmetric(horizontal: 20), // 좌우 대칭
      padding: EdgeInsets.fromLTRB(20, 4, 20, 16), //좌상우하 지정
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '추천 시설',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '카드의 이미지, 제목, 설명, 태그를 보고 필요한 공간을 빠르게 확인해 보세요.',
            style: TextStyle(
              color: Color(0xFF5F6368),
              height: 1.45, //fontSize에 비례한 줄 높이. 여러 줄에서는 줄 간격 효과
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text('학습')),
              Chip(label: Text('프로젝트')),
              Chip(label: Text('휴식')),
            ],
          ),
        ],
      ),
    );
  }
}
