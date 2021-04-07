List<int>? calculateChangeWithDenominations(int price, int given) {
  var rest = given - price;
  var payout = <int>[];

  var denominations = <int>[
    200,
    100,
    50,
    20,
    10,
    5,
    2,
    1,
  ];
  if (price > given) {
    return null;
  }
  for (var i = 0; rest > 0;) {
    if (rest >= denominations[i]) {
      //add 200; i--
      payout.add(denominations[i]);
      //rest -= denomination[i]
      rest -= payout.last;
    } else {
      i++;
    }
  }
  return payout;
}
