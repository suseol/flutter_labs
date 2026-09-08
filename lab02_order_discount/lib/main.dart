// 2주차 주문·할인 계산기 - 학생 실습 코드
// STEP 01~07에서 확인한 Dart 문법을 이용해 TODO 1~8을 완성한다.

import 'package:flutter/material.dart';

void main() {
  runApp(const OrderDiscountApp());
}

class MenuItem {
  final String name;
  final int price;

  // TODO 7-A: category 변수(필드)를 String 타입으로 추가하고 생성자에서 '기타' 값으로 초기화한다.
  const MenuItem({
    required this.name,
    required this.price,
  });
}

class OrderItem {
  final MenuItem menu;
  int quantity;

  OrderItem({
    required this.menu,
    this.quantity = 0,
  });

  // TODO 8: 이 method를 getter + => 형태로 바꾼다.
  // 바꾼 뒤 lineTotal()을 사용하는 곳도 lineTotal로 수정한다.
  int lineTotal() {
    return menu.price * quantity;
  }
}

// class 밖에 선언된 top-level function.
// 화면 상태와 직접 관계없이 주문 목록을 받아 상품 금액을 계산한다.
int calculateSubtotal(List<OrderItem> orders) {
  var subtotal = 0;

  for (final order in orders) {
    subtotal += order.lineTotal();
  }

  return subtotal;
}

// TODO 6: positional parameter를 named parameter로 바꾼다.
// subtotal, isMember는 필수
// useCoupon은 생략가능, 초깃값은 false
int calculateDiscount(int subtotal, bool isMember, bool useCoupon) {
  var discount = 0;

  // 회원 할인 10%는 처음부터 동작한다.
  if (isMember) {
    discount += (subtotal * 0.10).round();
  }

  // TODO 4-B: 쿠폰을 사용하고 상품 금액이 15,000원 이상이면
  // 2,000원을 추가 할인한다.

  // TODO 5-A: 상품 금액이 30,000원 이상이면
  // 상품 금액의 5%를 대량 주문 할인으로 추가한다.

  return discount;
}

int calculateShippingFee(int amountAfterDiscount) {
  // TODO 3: 배송비 규칙을 if와 return으로 완성한다.
  // 1) 할인 후 상품 금액이 0원이면 배송비 0원
  // 2) 할인 후 상품 금액이 25,000원 이상이면 배송비 0원
  // 3) 그 외에는 배송비 3,000원
  //
  // 현재는 항상 3,000원을 반환하므로 주문이 없어도 배송비가 붙는다.
  return 3000;
}

class OrderDiscountApp extends StatelessWidget {
  const OrderDiscountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const OrderPage(),
    );
  }
}

class OrderPage extends StatefulWidget {
  // 생성자. 전달받은 key를 부모 StatefulWidget에 전달.
  // key는 Flutter가 위젯을 식별할 때 사용하는 값
  const OrderPage({super.key});

  // 부모 클래스의 createState() 메서드를 오버라이드
  // OrderPage를 위한 State 객체(_OrderPageState)를 생성해서 return
  // _OrderPageState는 State<OrderPage>를 상속하므로 반환 가능
  @override
  State<OrderPage> createState() => _OrderPageState();
}

// 이름 앞의 _는 Dart의 library-private 표기이다.
// 2주차에서는 _orders, _changeQuantity처럼 이 파일 내부 구현에 사용하는
// 이름이라는 정도로 읽고, 접근 제어의 자세한 의미는 이후에 다시 다룬다.
class _OrderPageState extends State<OrderPage> {
  final List<OrderItem> _orders = [
    OrderItem(
      menu: const MenuItem(
        name: '아메리카노',
        price: 3000,
      ),
    ),
    OrderItem(
      menu: const MenuItem(
        name: '카페라떼',
        price: 4500,
      ),
    ),

    // TODO 1: 샌드위치, 6,500원 메뉴를 추가한다.

  ];

  // 사용자의 조작에 따라 값이 바뀌고 화면에도 영향을 주는 상태 값이다.
  bool _isMember = false;
  bool _useCoupon = false;

  void _changeQuantity(OrderItem order, int difference) {
    // () { ... }는 익명 함수이며,
    // 이 함수를 setState()의 매개변수로 전달
    setState(() {
      final nextQuantity = order.quantity + difference;

      // 현재는 계산된 값을 그대로 저장하므로 -1, 11 같은 수량도 가능하다.
      order.quantity = nextQuantity;

      // TODO 2: if / else if / else를 사용해 수량을 0~10으로 제한한다.
      // 단순 대입을 조건문으로 바꿔 해결한다.
    });
  }

  void _changeMember(bool value) {
    setState(() {
      _isMember = value;
    });
  }

  void _changeCoupon(bool value) {
    // TODO 4-A: 현재는 쿠폰 스위치를 눌러도 상태가 바뀌지 않는다.
    // setState() 안에서 _useCoupon 값에 value를 대입하도록 수정

  }

  void _resetOrder() {
    setState(() {
      for (final order in _orders) {
        order.quantity = 0;
      }
      _isMember = false;
      _useCoupon = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // [화면 갱신의 큰 흐름]
    // 앱이 처음 화면을 만들 때 build()가 호출된다.
    // 이후 setState()가 호출되면 Flutter가 이 State의 build()를
    // 다시 호출하도록 예약한다.
    // 따라서 아래 계산도 다시 실행되고, 새 값으로 화면 전체가 다시 구성된다.
    // Text의 글자를 setText()처럼 직접 바꾸는 방식이 아니다.

    final subtotal = calculateSubtotal(_orders);
    final discount = calculateDiscount(
      subtotal,
      _isMember,
      _useCoupon,
    );
    final amountAfterDiscount = subtotal - discount;
    final shippingFee = calculateShippingFee(amountAfterDiscount);
    final total = amountAfterDiscount + shippingFee;

    // 2주차에 배운 List + add() + for-in으로 화면 목록을 만든다.
    final children = <Widget>[];

    children.add(
      const Text(
        '변수 → 조건 → List → 함수 → named parameter → class의 흐름을 앱에서 확인합니다.',
      ),
    );
    children.add(const SizedBox(height: 16));
    children.add(
      Text(
        '1. 메뉴 선택',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
    children.add(const SizedBox(height: 8));

    for (final order in _orders) {
      children.add(_buildMenuCard(order));
    }

    children.add(const SizedBox(height: 16));
    children.add(
      Text(
        '2. 할인 조건',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
    children.add(const SizedBox(height: 8));
    children.add(_buildDiscountCard());
    children.add(const SizedBox(height: 16));
    children.add(
      Text(
        '3. 계산 결과',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
    children.add(const SizedBox(height: 8));
    children.add(
      _buildSummaryCard(
        subtotal: subtotal,
        discount: discount,
        shippingFee: shippingFee,
        total: total,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('주문/할인 계산기'),
        actions: [
          IconButton(
            // 매개변수가 없는 함수는 () 없이 함수 이름 자체를 전달할 수 있다.
            onPressed: _resetOrder,
            tooltip: '주문 초기화',
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: children,
        ),
      ),
    );
  }

  // class 안에 선언된 method.
  // OrderItem 하나를 받아 메뉴 한 줄의 Widget을 만들어 반환한다.
  Widget _buildMenuCard(OrderItem order) {
    return Card(
      child: ListTile(
        title: Text(order.menu.name),
        // TODO 7-B: category를 추가한 뒤 단가 앞에 표시한다.
        // 예: '음료 | 3,000원'
        subtitle: Text(
          '${order.menu.price}원\n합계 ${order.lineTotal()}원',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              // _changeQuantity는 order와 difference가 필요하므로
              // () => ... 익명 함수를 만들어 버튼에 전달한다.
              onPressed: () => _changeQuantity(order, -1),
              icon: const Icon(Icons.remove_circle_outline),
            ),
            SizedBox(
              width: 28,
              child: Text(
                '${order.quantity}',
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: () => _changeQuantity(order, 1),
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscountCard() {
    return Card(
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('회원 할인 10%'),
            value: _isMember,
            // bool value를 받는 함수도 Flutter가 요구하는 형태와 맞으면
            // 함수 이름 자체를 callback으로 전달할 수 있다.
            onChanged: _changeMember,
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: const Text('2,000원 쿠폰'),
            subtitle: const Text('15,000원 이상 주문 시 적용'),
            value: _useCoupon,
            onChanged: _changeCoupon,
          ),

          // TODO 5-B: 대량 주문 할인 규칙을 UI 상에서 볼 수 있도록
          // Divider와 ListTile을 추가한다. (SwitchListTile 대신)
          // 제목: '대량 주문 할인 5%'
          // 설명: '상품 금액 30,000원 이상이면 자동 적용'
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required int subtotal,
    required int discount,
    required int shippingFee,
    required int total,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('상품 금액: $subtotal원'),
            Text('할인 금액: $discount원'),
            Text('배달비: $shippingFee원'),
            const Divider(),
            Text(
              '최종 결제 금액: $total원',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}