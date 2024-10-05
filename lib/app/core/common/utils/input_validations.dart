class InputValidations {
  static String? simpleInputValidation(String? value, {int? minLengh}) {
    if (value == null || value.isEmpty) {
      return 'Preencha este campo';
    }
    if (minLengh != null && value.length < minLengh) {
      return 'Preencha com no mínimo $minLengh caracteres';
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Insira o seu Email';
    }
    if (value.length < 10) {
      return 'Insira todo o Email';
    }
    if (value.contains('@') && value.contains('.com')) {
      return null;
    }
    return 'Email inválido';
  }
}
