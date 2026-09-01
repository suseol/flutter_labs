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
      home: const ProfileCardPage(),
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
