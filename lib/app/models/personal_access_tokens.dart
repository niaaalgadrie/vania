import 'package:vania/vania.dart';
import 'package:mysql1/mysql1.dart';

class PersonalAccessTokens extends Model{
    
  PersonalAccessTokens(){
    MySqlConnection.connect;
    super.table('personal_access_tokens');
  }
}