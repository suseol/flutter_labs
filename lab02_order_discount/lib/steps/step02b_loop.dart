// STEP 02b: 반복문
void main(){
  var prices = [2500, 4000, 3000, 1800, 5000]; // List<int>로 타입 추론
  const minPrice = 3000;

  var sum = 0;

  // 일반 for문: 인덱스를 이용하여 모든 가격 합계 계산
  for (var i = 0; i < prices.length; i++) {
    sum += prices[i];
  }
  print('모든 가격 합계 = $sum원');

  sum = 0;

  // for-in문: List와 같은 컬렉션의 각 요소를 하나씩 가져와 순서대로 처리
  for (final price in prices) {
    if (price >= minPrice) {
      sum += price;
    }
  }
  print('$minPrice원 이상 가격 합계 = $sum원');
}