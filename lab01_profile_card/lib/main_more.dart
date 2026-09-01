import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Week 01 Profile Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF11938B)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F8F8),
      ),
      // home: const ProfileCardPage(),
      home: const ProfileCardBackgroundPage(),
      // home: const ProfileCardKakao(),
    );
  }
}

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 프로필'),
        centerTitle: true,
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/profile_background_landscape.png',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 2,
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 62,
                          backgroundImage: AssetImage('assets/images/profile_avatar.png'),
                        ),
                        const SizedBox(height: 18),
                        const Text('홍길동', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text('AI정보통신공학과 · 모바일 앱 개발 입문', textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 14),
                        Text('Flutter로 아이디어를 화면에 구현하는 개발자가 되고 싶습니다.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(height: 26),
                        const Divider(),
                        const SizedBox(height: 14),
                        const _SectionTitle(icon: Icons.interests_outlined, title: '관심 분야'),
                        const SizedBox(height: 12),
                        const Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: [
                            Chip(label: Text('Flutter')),
                            Chip(label: Text('AI')),
                            Chip(label: Text('IoT')),
                            Chip(label: Text('Cloud')),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const _SectionTitle(icon: Icons.contact_mail_outlined, title: '연락처'),
                        const SizedBox(height: 12),
                        const _InfoRow(icon: Icons.email_outlined, text: 'gildong@example.com'),
                        const SizedBox(height: 10),
                        const _InfoRow(icon: Icons.phone_outlined, text: '010-1234-5678'),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('버튼이 정상적으로 동작합니다.')),
                              );
                            },
                            icon: const Icon(Icons.rocket_launch_outlined),
                            label: const Text('첫 Flutter 앱 실행 완료'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Week 01 · Text · Image · Icon · Row · Column', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 백그라운드 이미지를 적용한 배경형 (Column 대신 Stack 으로 여러 요소를 겹치는 방식
// ProfileCardBackgroundPage
class ProfileCardBackgroundPage extends StatelessWidget {
  const ProfileCardBackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 프로필'),
        centerTitle: true,
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
      ),

      // 기존 SingleChildScrollView를 Stack으로 감싼다.
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. 기존 배너 대신 전체 화면 배경 이미지 사용
          Image.asset(
            'assets/images/profile_background2.png',
            fit: BoxFit.cover,
          ),

          // 2. 배경 위에 반투명 그라데이션 추가
          // 밝은 이미지에서도 카드와 글자가 잘 보이도록 한다.
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.10),
                  Color.fromRGBO(0, 0, 0, 0.55),
                ],
              ),
            ),
          ),

          // 3. 기존 프로필 카드 내용을 배경 이미지 위에 배치

          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: Column(
                  children: [
                    // 기존 배너 이미지와 여백 SizedBox 삭제
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(24),
                    //   child: Image.asset(
                    //     'assets/images/profile_banner.png',
                    //     height: 120,
                    //     width: double.infinity,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    // const SizedBox(height: 10),
                    Card(
                      elevation: 2,
                      // 배경 이미지가 살짝 비치도록 투명도만 조정
                      color: const Color.fromRGBO(255, 255, 255, 0.70),

                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 62,
                              backgroundImage: AssetImage('assets/images/profile_avatar.png'),
                            ),
                            const SizedBox(height: 18),
                            const Text('홍길동', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            Text('AI정보통신공학과 · 모바일 앱 개발 입문', textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 14),
                            Text('Flutter로 아이디어를 화면에 구현하는 개발자가 되고 싶습니다.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(height: 26),
                            const Divider(),
                            const SizedBox(height: 14),
                            const _SectionTitle(icon: Icons.interests_outlined, title: '관심 분야'),
                            const SizedBox(height: 12),
                            const Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              alignment: WrapAlignment.center,
                              children: [
                                Chip(label: Text('Flutter')),
                                Chip(label: Text('AI')),
                                Chip(label: Text('IoT')),
                                Chip(label: Text('Cloud')),
                              ],
                            ),
                            const SizedBox(height: 24),
                            const _SectionTitle(icon: Icons.contact_mail_outlined, title: '연락처'),
                            const SizedBox(height: 12),
                            const _InfoRow(icon: Icons.email_outlined, text: 'gildong@example.com'),
                            const SizedBox(height: 10),
                            const _InfoRow(icon: Icons.phone_outlined, text: '010-1234-5678'),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton.icon(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('버튼이 정상적으로 동작합니다.')),
                                  );
                                },
                                icon: const Icon(Icons.rocket_launch_outlined),
                                label: const Text('첫 Flutter 앱 실행 완료'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 어두운 배경에서 보이도록 글자색만 변경
                    Text('Week 01 · Text · Image · Icon · Row · Column',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// 백그라운드 이미지를 적용하고 카톡 프로필처럼 적용한 사례
// ProfileCardKakao
class ProfileCardKakao extends StatelessWidget {
  const ProfileCardKakao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('나의 프로필'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. 전체 화면 배경 이미지
          Image.asset(
            'assets/images/profile_background.png',
            fit: BoxFit.cover,
          ),

          // 2. 글자가 잘 보이도록 어두운 그라데이션 추가
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.10),
                  Color.fromRGBO(0, 0, 0, 0.75),
                ],
              ),
            ),
          ),

          // 3. 배경 이미지 위에 프로필 정보 표시
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Spacer(),

                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage(
                      'assets/images/profile_avatar.png',
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    '홍길동',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'AI정보통신공학과 · 모바일 앱 개발 입문',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      Chip(label: Text('Flutter')),
                      Chip(label: Text('AI')),
                      Chip(label: Text('IoT')),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // 채팅·통화 버튼 영역
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.30),
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.white,
                            ),
                            label: const Text(
                              '채팅',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                          child: VerticalDivider(color: Colors.white38),
                        ),
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.phone_outlined,
                              color: Colors.white,
                            ),
                            label: const Text(
                              '통화',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22),
        const SizedBox(width: 12),
        Expanded(child: Text(text)),
      ],
    );
  }
}
