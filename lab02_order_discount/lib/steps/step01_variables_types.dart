// STEP 01: 값에 이름 붙이기 - 변수, 타입, final, const, 문자열 보간

void main() {
  String menuName = '아메리카노';
  int price = 3000;
  int quantity = 2;
  bool isMember = true;

  // var: 초기값을 보고 Dart가 타입을 추론한다.
  var storeName = 'Campus Cafe';

  // final: 실행 중 한 번 값이 정해지면 다시 대입하지 않는다.
  final subtotal = price * quantity;

  // const: 실행 전부터 값이 정해진 컴파일 시점 상수이다.
  const memberDiscountRate = 0.10;

  print('매장: $storeName');
  print('메뉴: $menuName');
  print('가격: $price원 × 수량: $quantity개');
  print('상품 금액: $subtotal원');
  print('회원 여부: $isMember');
  print('회원 할인율: ${memberDiscountRate * 100}%');

  // dynamic은 이번 주문 앱의 핵심 문법은 아니다.
  // JSON처럼 값의 타입을 하나로 정하기 어려운 데이터를 다룰 때 다시 학습한다.
}
