// STEP 04: 함수의 기본

void main() {
  int discount = calculateDiscount(50000, 10);
  printDiscount(discount);

  printDiscount( calculateDiscountOneLine(50000, 10) );
}

// 클래스 밖에 선언한 top-level 함수
int calculateDiscount(int price, int discountRate) {
  int discount = (price * discountRate / 100).toInt();

  // 정수 나눗셈 연산자를 사용하면:
  // int discount = price * discountRate ~/ 100;

  // 반올림하려면:
  // int discount = (price * discountRate / 100).round();

  return discount;
}
// 반환값이 없는 void 타입의 함수
void printDiscount(int discount) {
  print('할인 금액: $discount원');
}
// 하나의 표현식 결과를 바로 반환하는 함수는 =>로 간단히 표현할 수 있음
int calculateDiscountOneLine(int price, int discountRate) =>
    (price * discountRate / 100).toInt();

// ------------------------------------------------------------
// 참고: 함수는 어디에 선언할 수 있을까?
// ------------------------------------------------------------
//
// 현재 calculateDiscount(), printDiscount()처럼
// 클래스 밖에 선언한 함수를 top-level 함수라고 한다.
//
// Dart의 함수는
// - top-level에 선언할 수도 있고
// - 클래스의 멤버(method)로 선언할 수도 있고
// - 다른 함수 안에 선언할 수도 있다.
//
// 클래스 안의 함수는 이후 Step06에서 다시 다룬다.