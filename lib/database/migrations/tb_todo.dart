import 'package:vania/vania.dart';

class TbTodo extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('tb_todo', () {
      id();
      bigInt('user_id', unsigned: true);
      string('title');
      text('description');
      timeStamps();
      foreign('user_id', 'users', 'id');
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('tb_todo');
  }
}
