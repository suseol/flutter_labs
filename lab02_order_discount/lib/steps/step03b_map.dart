// STEP 03b Map
void main() {
  const targetMenu = '카페라떼';

  // List 방식: 먼저 메뉴의 index를 찾은 후 같은 index의 가격을 조회
  final menuNames = ['아메리카노', '카페라떼', '샌드위치'];
  final prices = [3000, 4500, 6500];

  final index = menuNames.indexOf(targetMenu);
  print('$targetMenu 가격: ${prices[index]}원');

  // Map 방식: 메뉴 이름(key)으로 가격(value)을 바로 조회
  final priceByMenu = { // Map<String, int>로 타입 추론
    '아메리카노': 3000,
    '카페라떼': 4500,
    '샌드위치': 6500,
  };

  print('$targetMenu 가격: ${priceByMenu[targetMenu]}원');
}