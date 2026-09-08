// STEP 03a List
void main() {
  final menuNames = ['아메리카노', '카페라떼', '샌드위치']; // List<String>
  final prices = [3000, 4500, 6500];                    // List<int>

  print('메뉴 개수: ${menuNames.length}');
  print('첫 번째 메뉴: ${menuNames[0]}');
  print('두 번째 메뉴 가격: ${prices[1]}원');

  menuNames.add('쿠키'); // final이어도 List 내부 변경은 가능
  prices.add(2000);

  // menuNames = ['콜라', '주스']; // 오류: 다른 List로 재할당 불가

  print('추가 후 메뉴: $menuNames');
  print('마지막 메뉴: ${menuNames.last}');

  List<int> list1 = [3000, 4500, 6000];
  var list2 = [3000, 4500, 6000];
  final list3 = List<int>.filled(3, 5000); // 3개의 고정길이 List를 만들고 초기값은 5000으로 설정
  print(list1.toString() + list2.toString() + list3.toString());
  list1 += list2;
  list1.removeAt(3);
  print(list1);
  list3[0] = 1000;
  print(list3);
}