import 'package:test/test.dart';
import 'package:coin_changer/functions.dart';

import 'test_basis.dart';

void main() {
  test('change is not empty', () {
    final change = calculateChangeWithDenominations(360, 500);
    expect(change?.isNotEmpty, true);
  });

  test('change(360,500) = [100,20,20]', () {
    final change = calculateChangeWithDenominations(360, 500);
    expect(eq(change, [100, 20, 20]), true);
  });

  test('change(360,360) = []', () {
    final change = calculateChangeWithDenominations(360, 360);
    expect(eq(change, []), true);
  });

  test('change(360,350) = null', () {
    final change = calculateChangeWithDenominations(360, 350);
    expect(change == null, true);
  });
}
