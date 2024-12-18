import 'package:vania/vania.dart';
import 'package:mysql1/mysql1.dart';

class ProductNotes extends Model{
    
  ProductNotes(){
    MySqlConnection.connect;
    super.table('productnotes');
  }

}