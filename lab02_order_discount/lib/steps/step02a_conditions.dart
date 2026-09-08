// STEP 02a: 조건에 따라 다르게, 여러 번 반복하기 - if, else if, switch, for

void main() {
  // 수량이 0보다 작아지거나 10보다 커지지 않도록 하려면?
  int quantity = 0;
  const difference = -1;

  quantity += difference;

  if (quantity < 0) {
    quantity = 0;
  } else if (quantity > 10) {
    quantity = 10;
  }

  print('변경된 수량: $quantity개');

  // switch: 하나의 값에 따라 여러 경우를 나눌 때 가독성 좋음
  const orderType = 'delivery';
  switch (orderType) {
    case 'delivery':
      print('배달 주문');
      // break; // Dart 3부터 case 끝의 break 생략 가능
    case 'pickup':
      print('포장 주문');
    default:
      print('주문 유형 확인 필요');
  }
}
