import 'package:coin_changer/functions.dart';

void main(List<String> arguments) {
  var list = calculateChangeWithDenominations(360, 500);
  print('$list');
}
