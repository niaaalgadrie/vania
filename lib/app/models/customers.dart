import 'package:vania/vania.dart';
import 'package:mysql1/mysql1.dart';

class Customers extends Model{
    
  Customers(){
    MySqlConnection.connect;
    super.table('customers');
  }
}