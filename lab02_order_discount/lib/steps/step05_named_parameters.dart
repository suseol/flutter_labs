// STEP 05: 매개변수가 많아질 때 - named parameter, required, default

void main() {
  // positional parameter 방식: 금액, 할인율, 쿠폰금액 순서대로 전달
  print(calculateDiscount(50000, 10, 3000));
  // named parameter 방식: 변수 이름과 값을 매칭하여 전달
  print(
    calculateDiscountNamed(
      price: 50000,
      discountRate: 10,
      couponDiscount: 3000,
    ),
  );
  // 생략 가능한 매개변수를 빼고 호출: 기본값이 사용됨
  print(calculateDiscountNamed(price: 50000, discountRate: 10));
}

// positional parameter 방식의 함수 선언
int calculateDiscount(int price, int discountRate, int couponDiscount) {
  return (price * discountRate / 100).toInt() + couponDiscount;
}

// named parameter 방식의 함수 선언
int calculateDiscountNamed({
  required int price,
  required int discountRate,
  int couponDiscount = 0, //생략하면 default 값 사용
}) {
  return (price * discountRate / 100).toInt() + couponDiscount;
}