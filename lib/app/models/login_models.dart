import 'package:vania/vania.dart';
import 'package:mysql1/mysql1.dart';

class LoginModels extends Model{
    
  LoginModels(){
    MySqlConnection.connect;
    super.table('tb_login');
  }

}
