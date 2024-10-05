class NumberUtils {
  static int? onlyNumbers(String number) => int.tryParse(number.replaceAll(RegExp(r'[^0-9]'), ''));

  static String buildCurrencyValue(double value) => value == 0 ? 'GRATIS' : 'R\$ ${value.toStringAsFixed(2)}';
}
