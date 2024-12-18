import 'package:vania/vania.dart';
import 'package:mysql1/mysql1.dart';

class Products extends Model{
    
  Products(){
    MySqlConnection.connect;
    super.table('product');
  }
}
