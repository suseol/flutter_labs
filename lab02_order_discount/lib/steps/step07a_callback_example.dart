// STEP 07a: 아래는 단계별 이해를 돕기 위한 코드임
// 실행되는 코드는 아님.

// void main(){
//   // 현재 화면에 표시 중인 주문
//   final order = orders[index];
//
//   // [-] 버튼이 눌렸을 때 실행할 함수
//   void onMinusPressed() {
//     changeQuantity(order, -1);
//   }
//
//   // [+] 버튼이 눌렸을 때 실행할 함수
//   void onPlusPressed() {
//     changeQuantity(order, 1);
//   }
//
//   // 함수를 변수에 저장
//   final minusFn = onMinusPressed;
//   final plusFn = onPlusPressed;
//
//   // 버튼에 함수 전달
//   IconButton(
//     onPressed: minusFn,
//     icon: const Icon(Icons.remove_circle_outline),
//   );
//
//   IconButton(
//     onPressed: plusFn,
//     icon: const Icon(Icons.add_circle_outline),
//   );
//
//   // 실제 수량을 변경하는 함수
//   void changeQuantity(OrderItem order, int difference) {
//     order.quantity += difference;
//   }
// }
//
// void changeQuantity(OrderItem order, int difference){
//   order.quantity += difference;
// }