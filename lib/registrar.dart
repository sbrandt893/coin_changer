class Registrar {
  Registrar(
      {required this.price, required this.given, required this.registrar});
  int given;
  int price;
  List<int> payout = [];
  List<int> registrar;
  void process() {
    var rest = given - price;

    for (var i = 0; i < registrar.length && rest > 0;) {
      if (rest >= registrar[i]) {
        payout.add(registrar[i]);
        registrar.removeAt(i);
        rest -= payout.last;
      } else {
        i++;
      }
    }
    if (rest > 0) {
      registrar += payout;
      payout.clear();
      return;
    }
    given = 0;
    price = 0;
  }
}
