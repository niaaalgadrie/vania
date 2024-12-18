import 'dart:io';
import 'package:vania/vania.dart';
import 'create_users_table.dart';
import 'tb_login.dart';
import 'personal_access_tokens.dart';
import 'tb_todo.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
		 await CreateUserTable().up();
		 await TbLogin().up();
		 await PersonalAccessTokens().up();
		 await TbTodo().up();
	}

  dropTables() async {
		 await TbTodo().down();
		 await PersonalAccessTokens().down();
		 await TbLogin().down();
		 await CreateUserTable().down();
	 }
}
