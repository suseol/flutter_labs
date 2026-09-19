// 주문/할인 계산기 - 확장 과제 Starter
//
// 과제 목표
// 1) 카테고리별 쿠폰 할인 기능을 직접 구현한다.
// 2) 현재 if / else if 방식의 카드 할인 코드를
//    "할인 정책 함수를 선택하고 다른 함수에 전달하는 구조"로 리팩터링한다.
//
// UI와 상태 변경 코드는 제공된다.
// Starter 상태에서도 앱은 오류 없이 실행된다.
//
// Starter에서의 동작
// - 회원 할인: 정상 동작
// - 대량 주문 할인: 정상 동작
// - 카드 할인: 기존 if / else if 방식으로 정상 동작
// - 카테고리 쿠폰 할인: 아직 0원으로 계산됨
//
// 최종 카드 할인 공통 규칙
// - 상품 금액 10,000원 이상부터 카드 할인 적용
// - 카드 할인은 최대 5,000원
//
// 카드사별 정책
// - KB: 정액 1,500원
// - 신한: 상품 금액의 10%
// - 하나: 상품 금액 10,000원 단위마다 1,000원

import 'package:flutter/material.dart';

void main() {
  runApp(const OrderDiscountApp());
}

class MenuItem {
  final String name;
  final int price;
  final String category;

  const MenuItem({
    required this.name,
    required this.price,
    this.category = '기타',
  });
}

class OrderItem {
  final MenuItem menu;
  int quantity;

  OrderItem({
    required this.menu,
    this.quantity = 0,
  });

  int get lineTotal => menu.price * quantity;
}

// 주문 목록 전체의 상품 금액을 계산한다.
int calculateSubtotal(List<OrderItem> orders) {
  var subtotal = 0;

  for (final order in orders) {
    subtotal += order.lineTotal;
  }

  return subtotal;
}

// 기존 회원 할인과 대량 주문 할인을 계산한다.
int calculateDiscount({
  required int subtotal,
  required bool isMember,
}) {
  var discount = 0;

  if (isMember) {
    discount += (subtotal * 0.10).round();
  }

  if (subtotal >= 30000) {
    discount += (subtotal * 0.05).round();
  }

  return discount;
}

// [과제 구현 위치 1]
// 특정 카테고리의 주문 금액만 합산하여 쿠폰 할인액을 계산하도록 완성한다.
//
// 요구사항
// - orders에서 category가 일치하는 주문만 찾는다.
// - 해당 주문의 lineTotal을 모두 더한다.
// - 합계에 rate를 적용하여 할인 금액을 반환한다.
// - 같은 함수를 음료 쿠폰과 식사 쿠폰에 재사용해야 한다.
int calculateCategoryCoupon({
  required List<OrderItem> orders,
  required String category,
  double rate = 0.10,
}) {
  return 0;
}

// ------------------------------------------------------------
// [과제 구현 위치 2-1: 카드 할인 함수 구조 변경]
// ------------------------------------------------------------
//
// 현재 calculateCardDiscount()는
// 1) 카드 종류를 판단하고
// 2) 카드사별 할인 금액을 계산하고
// 3) 모든 카드에 공통인 최소 주문 금액과 최대 할인 한도까지
// 하나의 함수 안에서 모두 처리한다.
//
// 최종 Solution에서는 이 함수를 제거하고,
// 과제 안내서에 제시된 applyCardDiscount() 함수로 변경한다.
//
// applyCardDiscount()의 역할
// - subtotal과 "카드 할인 정책 함수"를 매개변수로 받는다.
// - 상품 금액 10,000원 미만이면 0원을 반환한다.
// - 전달받은 카드 할인 정책 함수를 실행한다.
// - 계산된 카드 할인이 5,000원을 초과하면 5,000원만 반환한다.
//
// 중요:
// 카드사별 익명함수를 여기에서 작성하는 것이 아니다.
// 실제로 어떤 카드 정책 함수를 사용할지 선택하고,
// 익명함수를 정의하고,
// applyCardDiscount()를 호출하는 코드는
// 아래 _OrderPageState의 build() 내부에서 작성한다.
//
// 따라서 카드 할인 과제는 이 위치만 수정하면 끝나지 않는다.
// build() 안의 [과제 구현 위치 2-2]도 반드시 함께 수정한다.
int calculateCardDiscount(
  String card,
  int subtotal,
) {
  // 모든 카드에 공통인 최소 주문 금액 조건
  if (subtotal < 10000) {
    return 0;
  }

  var discount = 0;

  // 카드사별 할인 정책
  if (card == 'KB') {
    discount = 1500;
  } else if (card == '신한') {
    discount = (subtotal * 0.10).round();
  } else if (card == '하나') {
    discount = (subtotal ~/ 10000) * 1000;
  }

  // 모든 카드에 공통인 최대 할인 한도
  if (discount > 5000) {
    return 5000;
  }

  return discount;
}

int calculateShippingFee(int amountAfterDiscount) {
  if (amountAfterDiscount == 0) {
    return 0;
  }

  if (amountAfterDiscount >= 25000) {
    return 0;
  }

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
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final List<OrderItem> _orders = [
    OrderItem(
      menu: const MenuItem(
        name: '아메리카노',
        price: 3000,
        category: '음료',
      ),
    ),
    OrderItem(
      menu: const MenuItem(
        name: '카페라떼',
        price: 4500,
        category: '음료',
      ),
    ),
    OrderItem(
      menu: const MenuItem(
        name: '샌드위치',
        price: 6500,
        category: '식사',
      ),
    ),
  ];

  // 사용자의 조작에 따라 바뀌는 원본 State
  bool _isMember = false;
  bool _useDrinkCoupon = false;
  bool _useFoodCoupon = false;
  String _selectedCard = 'KB';

  void _changeQuantity(OrderItem order, int difference) {
    setState(() {
      final nextQuantity = order.quantity + difference;

      if (nextQuantity < 0) {
        order.quantity = 0;
      } else if (nextQuantity > 10) {
        order.quantity = 10;
      } else {
        order.quantity = nextQuantity;
      }
    });
  }

  void _changeMember(bool value) {
    setState(() {
      _isMember = value;
    });
  }

  void _changeDrinkCoupon(bool value) {
    setState(() {
      _useDrinkCoupon = value;
    });
  }

  void _changeFoodCoupon(bool value) {
    setState(() {
      _useFoodCoupon = value;
    });
  }

  void _selectCard(String card) {
    setState(() {
      _selectedCard = card;
    });
  }

  void _resetOrder() {
    setState(() {
      for (final order in _orders) {
        order.quantity = 0;
      }

      _isMember = false;
      _useDrinkCoupon = false;
      _useFoodCoupon = false;
      _selectedCard = 'KB';
    });
  }

  @override
  Widget build(BuildContext context) {
    // 현재 State를 이용해 화면에 필요한 파생값을 계산한다.
    final subtotal = calculateSubtotal(_orders);

    final baseDiscount = calculateDiscount(
      subtotal: subtotal,
      isMember: _isMember,
    );

    // calculateCategoryCoupon()을 완성하면
    // 같은 함수를 category와 rate만 바꾸어 두 번 재사용하게 된다.
    final drinkCouponDiscount = _useDrinkCoupon
        ? calculateCategoryCoupon(
            orders: _orders,
            category: '음료',
            rate: 0.10,
          )
        : 0;

    final foodCouponDiscount = _useFoodCoupon
        ? calculateCategoryCoupon(
            orders: _orders,
            category: '식사',
            rate: 0.15,
          )
        : 0;

    final categoryCouponDiscount =
        drinkCouponDiscount + foodCouponDiscount;

    // ----------------------------------------------------------
    // [과제 구현 위치 2-2: build()에서 카드 할인 정책 함수 선택]
    // ----------------------------------------------------------
    //
    // 현재 Starter에서는 아래 한 줄의 calculateCardDiscount()가
    // 카드 이름 판단과 할인 계산을 모두 수행한다.
    //
    // 최종 Solution에서는 이 부분을 다음 흐름으로 변경한다.
    //
    // 1. int Function(int) 타입의 selectedCardPolicy 변수를 선언한다.
    // 2. switch (_selectedCard)를 사용해 현재 카드에 맞는
    //    할인 정책 함수를 선택한다.
    // 3. 각 case에서 카드별 할인 규칙을 "익명함수"로 작성하여
    //    selectedCardPolicy에 저장한다.
    //
    //    KB   : 정액 1,500원
    //    신한 : 상품 금액의 10%
    //    하나 : 상품 금액 10,000원 단위마다 1,000원
    //
    // 4. switch가 끝난 뒤 applyCardDiscount()를 한 번 호출한다.
    // 5. applyCardDiscount()의 두 번째 매개변수로
    //    selectedCardPolicy 함수를 전달한다.
    //
    // 즉, 익명함수를 정의하고 applyCardDiscount()를 실제 호출하는 코드는
    // 반드시 이 build() 내부에서 작성한다.
    //
    // 최종 흐름:
    // _selectedCard
    //      ↓
    // switch
    //      ↓
    // selectedCardPolicy에 익명함수 저장
    //      ↓
    // applyCardDiscount(subtotal, selectedCardPolicy)
    //      ↓
    // cardDiscount
    final cardDiscount = calculateCardDiscount(
      _selectedCard,
      subtotal,
    );

    final discount =
        baseDiscount + categoryCouponDiscount + cardDiscount;

    final amountAfterDiscount = subtotal - discount;
    final shippingFee = calculateShippingFee(amountAfterDiscount);
    final total = amountAfterDiscount + shippingFee;

    final children = <Widget>[];

    children.add(
      const Text(
        'List, 조건문, 함수, named parameter, class, getter, 함수 전달을 앱에서 확인합니다.',
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
    children.add(const SizedBox(height: 8));
    children.add(_buildCardDiscountCard());

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
        baseDiscount: baseDiscount,
        drinkCouponDiscount: drinkCouponDiscount,
        foodCouponDiscount: foodCouponDiscount,
        categoryCouponDiscount: categoryCouponDiscount,
        cardDiscount: cardDiscount,
        discount: discount,
        shippingFee: shippingFee,
        total: total,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('주문/할인 계산기 - 확장 과제'),
        actions: [
          IconButton(
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

  Widget _buildMenuCard(OrderItem order) {
    return Card(
      child: ListTile(
        title: Text(order.menu.name),
        subtitle: Text(
          '${order.menu.category} | ${order.menu.price}원\n'
          '합계 ${order.lineTotal}원',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
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

  // UI는 Starter에서 제공한다.
  Widget _buildDiscountCard() {
    return Card(
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('회원 할인 10%'),
            value: _isMember,
            onChanged: _changeMember,
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: const Text('음료 10% 할인 쿠폰'),
            subtitle: const Text('음료 카테고리 주문 금액에만 적용'),
            value: _useDrinkCoupon,
            onChanged: _changeDrinkCoupon,
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: const Text('식사 15% 할인 쿠폰'),
            subtitle: const Text('식사 카테고리 주문 금액에만 적용'),
            value: _useFoodCoupon,
            onChanged: _changeFoodCoupon,
          ),
          const Divider(height: 1),
          const ListTile(
            title: Text('대량 주문 할인 5%'),
            subtitle: Text('상품 금액 30,000원 이상이면 자동 적용'),
          ),
        ],
      ),
    );
  }

  // 카드 선택 UI도 Starter에서 제공한다.
  Widget _buildCardDiscountCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '카드사 할인',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            const Text(
              '공통: 상품 금액 10,000원 이상 / 최대 5,000원 할인',
            ),
            const SizedBox(height: 4),
            const Text(
              'KB: 1,500원 / 신한: 10% / 하나: 1만원 단위마다 1,000원',
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _selectCard('KB'),
                  child: const Text('KB'),
                ),
                ElevatedButton(
                  onPressed: () => _selectCard('신한'),
                  child: const Text('신한'),
                ),
                ElevatedButton(
                  onPressed: () => _selectCard('하나'),
                  child: const Text('하나'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('선택 카드: $_selectedCard'),
          ],
        ),
      ),
    );
  }

  // 계산 결과 UI도 Starter에서 제공한다.
  Widget _buildSummaryCard({
    required int subtotal,
    required int baseDiscount,
    required int drinkCouponDiscount,
    required int foodCouponDiscount,
    required int categoryCouponDiscount,
    required int cardDiscount,
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
            Text('기본 할인: $baseDiscount원'),
            Text('음료 쿠폰 할인: $drinkCouponDiscount원'),
            Text('식사 쿠폰 할인: $foodCouponDiscount원'),
            Text('카테고리 쿠폰 할인 합계: $categoryCouponDiscount원'),
            Text('카드 할인: $cardDiscount원'),
            Text('총 할인 금액: $discount원'),
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
