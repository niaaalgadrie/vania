import 'package:vania/vania.dart';

class TbLogin extends Migration {

  @override
  Future<void> up() async{
   super.up();
    await createTableNotExists('tb_login', () {
      id();
      string('name', length:100);
      string('email', length:191);
      string('password', length:200);
      dateTime('created_at', nullable: true);
      dateTime('updated_at', nullable: true);
      dateTime('deleted_at', nullable: true);
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('tb_login');
  }
}
