// STEP 07: 함수의 전달, 익명 함수, =>

void main() {
  // 1) 함수 이름 뒤에 ()를 붙이면 지금 실행됨
  sayHello();

  // 2) ()를 빼고 함수 이름만 쓰면 함수 자체를 값으로 처리
  final firstAction = sayHello; // final void Function() firstAction = sayHello;
  firstAction();

  // 3) 함수는 다른 함수의 매개변수로도 전달할 수 있음
  //    전달된 함수는 필요할 때 호출된다. → callback
  runAction(sayHello);

  // 4) 이름 없는 함수(anonymous function)를 바로 전달할 수도 있음
  runAction(() {
    print('익명 함수 실행');
  });

  // 5) 함수 몸체가 하나의 expression이면 =>로 간단히 표현할 수 있음
  runAction(() => print('=> 함수 실행'));

  // Flutter에서 자주 보는 코드 예시
  // onPressed: resetOrder
  // onPressed: () => changeQuantity(1)
  // setState(() {
  //   isMember = true;
  // });
}

void sayHello() {
  print('안녕하세요');
}

// void Function()은 '매개변수가 없고 반환값도 없는 함수'라는 함수 타입
// 2주차에서는 이 표기 자체를 외우기보다 "함수를 받는 매개변수"라는 의미만
void runAction(void Function() action) {
  print('함수를 전달받았습니다.');
  action();
}
