import 'package:vania/vania.dart';
import 'package:mysql1/mysql1.dart';

class Todo extends Model{
    
  Todo(){
    MySqlConnection.connect;
    super.table('tb_todo');
  }

}
