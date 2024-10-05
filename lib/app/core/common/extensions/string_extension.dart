extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension ToParams on Map<String, dynamic> {
  String toQueryParameter() {
    if (isEmpty) return '';
    String value = '?';
    for (var index = 0; index < length; index++) {
      value = '$value&${keys.elementAt(index)}=${values.elementAt(index)}';
      if (index < length - 1) {
        value = '$value&';
      }
    }

    return value;
  }
}

extension GetParams on String {
  Map<String, dynamic> getQueryParameters() {
    Map<String, dynamic> parameters = {};

    final paramsInString = split('?').last;
    var itens = paramsInString.split('&');

    for (var item in itens) {
      var param = item.split('=');
      if (param.length > 1) {
        parameters[param.first] = param.last;
      }
    }

    return parameters;
  }
}
