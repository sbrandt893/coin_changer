import 'package:coin_changer/registrar.dart';
import 'package:test/test.dart';

import 'test_basis.dart';

void main() {
  test('change(360,360) = [] => reset, if change is not sufficient', () {
    final reg = Registrar(price: 360, given: 360, registrar: [100, 10, 5]);
    reg.process();
    expect(reg.given, 0);
    expect(reg.price, 0);
    expect(eq(reg.payout, []), true);
    expect(eq(reg.registrar, [100, 10, 5]), true);
  });

  test('change(360,380) = [20] => reset (change==sufficient)', () {
    final reg = Registrar(
        price: 360, given: 380, registrar: [200, 100, 50, 20, 10, 5, 2, 1]);
    reg.process();
    expect(reg.price, 0);
    expect(reg.given, 0);
    expect(eq(reg.payout, [20]), true);
    expect(eq(reg.registrar, [200, 100, 50, 10, 5, 2, 1]), true);
  });

  test('change(360,380) = [10,10] => reset (change==sufficient, without 20)',
      () {
    final reg = Registrar(
        price: 360, given: 380, registrar: [200, 100, 50, 10, 10, 5, 2, 1]);
    reg.process();
    expect(reg.price, 0);
    expect(reg.given, 0);
    expect(eq(reg.payout, [10, 10]), true);
    expect(eq(reg.registrar, [200, 100, 50, 5, 2, 1]), true);
  });

  test('change(360,380) = [], if change is not sufficient', () {
    final reg = Registrar(
        price: 360, given: 380, registrar: [200, 100, 50, 10, 5, 2, 1]);
    reg.process();
    expect(reg.given, 380);
    expect(reg.price, 360);
    expect(eq(reg.payout, []), true);
    expect(eq(reg.registrar, [200, 100, 50, 10, 5, 2, 1]), true);
  });

  test('change(360,500) = [100,20,20], if change is not sufficient', () {
    final reg =
        Registrar(price: 360, given: 500, registrar: [200, 100, 20, 20, 5]);
    reg.process();
    expect(reg.given, 0);
    expect(reg.price, 0);
    expect(eq(reg.payout, [100, 20, 20]), true);
    expect(eq(reg.registrar, [200, 5]), true);
  });
}
