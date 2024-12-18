import 'package:vania/vania.dart';
import 'package:mysql1/mysql1.dart';

class Vendors extends Model{
    
  Vendors(){
    MySqlConnection.connect;
    super.table('vendors');
  }

}
