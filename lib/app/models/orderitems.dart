import 'package:vania/vania.dart';
import 'package:mysql1/mysql1.dart';

class OrderItems extends Model{
    
  OrderItems(){
    MySqlConnection.connect;
    super.table('orderitems');
  }

}
