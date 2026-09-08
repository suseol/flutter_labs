# Flutter Labs

Flutter 모바일 앱 개발 수업의 주차별 실습 코드 저장소입니다.

각 주차 폴더에서 필요한 파일을 확인한 뒤 자신의 Flutter 프로젝트에 복사하여 사용하세요.

---

## 1주차 - Profile Card

📁 [`lab01_profile_card`](./lab01_profile_card)

### 주요 파일 구조

```text
lab01_profile_card/
├── lib/
│   ├── main.dart
│   └── main_more.dart
├── assets/
└── pubspec.yaml
```

### 파일 설명

- `lib/main.dart` : 수업 실습 코드
- `lib/main_more.dart` : 추가 예제 코드
- `assets/` : 이미지 등 실습에 필요한 리소스
- `pubspec.yaml` : asset 설정 등 프로젝트 설정 참고

---

## 2주차 - Dart 기초와 주문 할인 앱

📁 [`lab02_order_discount`](./lab02_order_discount)

### 주요 파일 구조

```text
lab02_order_discount/
├── lib/
│   ├── main.dart
│   └── steps/
│       ├── step01_variables_types.dart
│       ├── step02a_conditions.dart
│       ├── step02b_loop.dart
│       ├── step03a_list.dart
│       ├── step03b_map.dart
│       ├── step04_functions.dart
│       └── ...
├── TODO_HELP.md
└── pubspec.yaml
```

### 파일 설명

- `lib/main.dart` : 주문 할인 앱 실습 코드
- `lib/steps/` : Dart 문법을 단계별로 학습하기 위한 실습 코드
- `TODO_HELP.md` : TODO 실습 진행 시 참고할 수 있는 도움말
- `pubspec.yaml` : Flutter 프로젝트 설정 참고

---

## 실습 파일 사용 방법

### 필요한 코드만 사용하는 경우

각 주차 폴더에서 필요한 파일을 자신의 Flutter 프로젝트에 복사하세요.

일반적으로 다음 파일을 확인하면 됩니다.

```text
lib/
assets/
pubspec.yaml
```

`assets` 폴더가 있는 경우에는 `pubspec.yaml`의 asset 설정도 함께 확인하세요.

예:

```yaml
flutter:
  assets:
    - assets/
```

---

## 단계별 실습 코드

일부 주차는 `lib/steps/` 폴더에 단계별 실습 코드를 제공합니다.

예:

```text
steps/
├── step01_...
├── step02_...
├── step03_...
└── ...
```

수업 진행 순서에 맞게 `step01`부터 차례대로 확인하면 됩니다.

---

## 전체 다운로드

현재까지의 모든 실습 자료를 한 번에 내려받으려면 GitHub 저장소에서

```text
Code → Download ZIP
```

을 선택하세요.

GitHub에서는 특정 하위 폴더만 ZIP으로 다운로드하는 기능을 기본 제공하지 않습니다.

---

## 주의사항

이 저장소의 폴더는 각 주차의 실습 코드와 필요한 자료를 제공하기 위한 용도입니다.

자신의 Flutter 프로젝트에 파일을 복사할 때는 다음 사항을 확인하세요.

1. `lib` 폴더의 Dart 파일
2. 필요한 `assets` 파일
3. `pubspec.yaml`의 dependencies와 assets 설정
4. package import 경로
5. Flutter SDK 및 패키지 버전 차이

`pubspec.yaml`을 수정한 경우 다음 명령을 실행하세요.

```bash
flutter pub get
```

---

## Repository

`flutter_labs`

Flutter 모바일 앱 개발 수업의 주차별 실습 코드와 예제를 제공합니다.
