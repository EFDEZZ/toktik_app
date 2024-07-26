import 'package:intl/intl.dart';

class HumanFormats {

  //Metodo para formatear los numeros Ej: 1000 --> 1K
  static String humanReadbleNumber( double number){

    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      
    ).format(number);

    return formatterNumber;
  }
}