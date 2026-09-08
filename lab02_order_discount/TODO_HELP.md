# 학생 실습 TODO 1~8

앱을 실행해 현재 동작을 확인한 뒤 TODO를 하나씩 해결한다. 각 TODO를 완료할 때마다 다시 실행하여 동작을 확인한다.

## TODO 1 — 메뉴 객체 하나 추가

`_orders` List에 주문 항목을 하나 더 추가한다.

- 메뉴명: `샌드위치`
- 가격: `6,500원`
- 학습 요소: `List<OrderItem>`, 객체 생성, `const MenuItem(...)`, named argument
- 확인: 앱의 메뉴 목록에 세 번째 항목이 나타나는가?

`category`는 TODO 7에서 모델에 추가한다.

## TODO 2 — 수량을 0~10으로 제한

현재 `_changeQuantity()`는 계산된 값을 그대로 저장하므로 음수나 10 초과 수량도 가능하다.

- 최소 수량: 0
- 최대 수량: 10
- 학습 요소: `if / else if / else`, 비교 연산자, 지역 변수 `nextQuantity`
- 확인: 0에서 `-`를 눌러도 0인지, 10에서 `+`를 눌러도 10인지 확인한다.

## TODO 3 — 배송비 규칙 완성

현재 `calculateShippingFee()`는 항상 3,000원을 반환한다.

- 할인 후 상품 금액이 0원이면 배송비 0원
- 할인 후 상품 금액이 25,000원 이상이면 배송비 0원
- 그 외에는 배송비 3,000원
- 학습 요소: 함수, 매개변수, `if`, `return`, 조건의 순서
- 확인: 주문 없음 / 25,000원 미만 / 25,000원 이상을 각각 시험한다.

## TODO 4 — 2,000원 쿠폰 완성

쿠폰은 상태 변경과 할인 계산 두 부분을 모두 완성해야 한다.

### TODO 4-A — 쿠폰 스위치 상태 변경

`_changeCoupon(bool value)`의 `setState(() { ... })` 안에서 `_useCoupon`에 `value`를 대입한다.

- 학습 요소: 함수 매개변수, 대입, 익명 함수가 다른 함수의 인수로 전달되는 모양
- 확인: 쿠폰 스위치가 실제로 켜지고 꺼지는가?

### TODO 4-B — 할인 계산에 쿠폰 반영

`calculateDiscount()`에 다음 조건을 추가한다.

- 쿠폰 사용 상태가 `true`
- 상품 금액이 15,000원 이상
- 두 조건을 모두 만족하면 2,000원 추가 할인
- 학습 요소: `bool`, `&&`, `if`, `+=`
- 확인: 15,000원 미만과 이상에서 쿠폰 결과가 다른가?

## TODO 5 — 대량 주문 할인 계산 + 화면 안내

사용자에게 보이는 할인 규칙과 실제 계산이 일치하도록 두 부분을 완성한다.

### TODO 5-A — 계산 로직

`calculateDiscount()`에서 상품 금액이 30,000원 이상이면 상품 금액의 5%를 추가 할인한다.

- 학습 요소: 비교 연산자, `if`, `+=`, `round()`
- 경계값 확인: 30,000원 직전과 30,000원 이상을 비교한다.

### TODO 5-B — 할인 조건 UI

`_buildDiscountCard()`에 완성 앱과 같은 안내를 추가한다.  
스위치 기능은 필요없기 때문에 SwitchListTile대신 ListTile 위젯을 사용한다.  
ListTile에서는 title과 subtitle 매개변수만 활용한다.  
제목: '대량 주문 할인 5%'  
설명: '상품 금액 30,000원 이상이면 자동 적용'

## TODO 6 — positional parameter → named parameter

현재 할인 함수는 다음과 같이 호출한다.

```dart
calculateDiscount(subtotal, _isMember, _useCoupon)
```

다음 형태로 변경한다.

```dart
int calculateDiscount({
  required int subtotal,
  required bool isMember,
  bool useCoupon = false,
})
```

호출부도 함께 수정한다.

```dart
calculateDiscount(
  subtotal: subtotal,
  isMember: _isMember,
  useCoupon: _useCoupon,
)
```

- 학습 요소: named parameter `{}`, `required`, default value
- 확인: 동작은 같지만 호출 코드에서 각 값의 의미가 더 명확하게 보이는가?

## TODO 7 — MenuItem 모델에 category 추가

`MenuItem`에 다음 field를 추가한다.

```dart
final String category;
```

생성자에서 초기화한다.

```dart
this.category = '기타',
```

각 메뉴에 카테고리를 지정한다.

- 아메리카노: `음료`
- 카페라떼: `음료`
- 샌드위치: `식사`

그리고 `_buildMenuCard()`의 subtitle을 다음 형태로 만든다.

```text
음료 | 3000원
합계 6000원
```

- 학습 요소: class, `final` field, constructor, `this.field`, default value
- 확인: 각 메뉴의 카테고리가 화면에 표시되는가?

## TODO 8 — method → getter + arrow

현재:

```dart
int lineTotal() {
  return menu.price * quantity;
}
```

다음과 같이 변경한다.

```dart
int get lineTotal => menu.price * quantity;
```

그리고 모든 `lineTotal()` 사용을 `lineTotal`로 변경한다.

- 학습 요소: getter, `=>`, method와 계산 속성의 읽는 방식 차이
- 확인: 앱 동작은 유지되면서 `order.lineTotal`처럼 읽히는가?

## setState() 코드 읽기

```dart
setState(() {
  _isMember = value;
});
```

STEP 07을 마친 뒤에는 다음 정도로 읽는다.

1. `() { ... }`는 이름 없는 함수이다.
2. 그 함수를 `setState()`의 매개변수로 전달한다.
3. 함수 안에서 상태 값을 변경한다.
4. `setState()`가 호출되면 Flutter가 이 State의 `build()`를 다시 호출하도록 예약한다.
5. `build()`에서 금액을 다시 계산하고 현재 상태를 이용해 화면을 다시 구성한다.

`StatefulWidget`, 위젯 생명주기와 `setState()`의 자세한 원리는 이후 주차에서 학습한다.
