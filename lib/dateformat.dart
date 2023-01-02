import 'package:intl/intl.dart';

class FormatDate{


 static String getFormattingDate(DateTime date){
   DateFormat df = DateFormat("dd-MM-yyyy");
   String dateAfterFormatormat = df.format(date);
   return dateAfterFormatormat;
  }
}