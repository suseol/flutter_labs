// STEP 06: 클래스. 관련 데이터를 하나로 묶기 - class, object, constructor, this, final, const, getter

void main() {
  const coffee = MenuItem(
    name: '아메리카노',
    price: 3000,
    category: '음료',
  );

  final order = OrderItem(
    menu: coffee,
    quantity: 2,
  );

  print('메뉴: ${order.menu.name}');
  print('카테고리: ${order.menu.category}');
  print('수량: ${order.quantity}개');
  print('금액: ${order.lineTotal}원');
}

class MenuItem {
  // 메뉴가 만들어진 뒤 이름, 가격, 카테고리는 바뀌지 않게 final로 둔다.
  final String name;
  final int price;
  final String category;

  // 변경되지 않는 메뉴 정보를 상수 객체로 만들 수 있도록 const 생성자로 선언
  // 모든 instance field가 final이므로 const 생성자를 만들 수 있음
  // 생성자의 파라미터는 named parameters 방식 적용
  const MenuItem({
    required this.name, // 필수 파라미터. this.name은 전달받은 값을 현재 객체의 name 필드에 넣는 축약 문법
    required this.price,
    this.category = '기타' // required가 없으니 옵션 파라미터. 디폴트 값은 '기타'로 지정
  });
}

class OrderItem {
  // 어떤 메뉴를 주문했는지는 유지하지만 수량은 사용자가 바꿀 수 있다.
  final MenuItem menu;
  int quantity;

  // quantity는 변경 가능한 필드이므로 const 생성자 사용 안 함
  OrderItem({
    required this.menu,
    this.quantity = 1, // 생략되면 초기 주문 수량 default 값을 1로 설정
  });

  // get 키워드를 이용해서 Getter로 만듦. ()없이 필드처럼 order.lineTotal 로 접근 가능
  // =>는 한 expression을 return하는 축약형
  int get lineTotal => menu.price * quantity;

  // [참고] Setter 예시. 항상 양수 값을 설정하도록 만드는 예:
  // set setQuantity(int v) => quantity = v.abs();
}
