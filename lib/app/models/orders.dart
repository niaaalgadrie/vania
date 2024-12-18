import 'package:vania/vania.dart';
import 'package:mysql1/mysql1.dart';

class Orders extends Model{
    
  Orders(){
    MySqlConnection.connect;
    super.table('orders');
  }

}
