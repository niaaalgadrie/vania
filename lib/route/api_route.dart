import 'package:vania/vania.dart';
import 'package:vania_project_1/app/http/controllers/auth_controller.dart';
import 'package:vania_project_1/app/http/controllers/customers_controller.dart';
import 'package:vania_project_1/app/http/controllers/orderitems_controller.dart';
import 'package:vania_project_1/app/http/controllers/orders_controller.dart';
import 'package:vania_project_1/app/http/controllers/productnotes_controller.dart';
import 'package:vania_project_1/app/http/controllers/products_controller.dart';
import 'package:vania_project_1/app/http/controllers/tb_login_controller.dart';
import 'package:vania_project_1/app/http/controllers/tb_todo_controller.dart';
import 'package:vania_project_1/app/http/controllers/vendors_controller.dart';
import 'package:vania_project_1/app/http/middleware/authenticate.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    Router.get("/show-user", customersController.show);
    Router.post("/create-user", customersController.create);
    Router.put("/update-user/{id}", customersController.update);
    Router.delete("/delete-user/{id}", customersController.destroy);

    Router.get("/show-vendor", vendorsController.show);
    Router.post("/create-vendor", vendorsController.create);
    Router.put("/update-vendor/{id}", vendorsController.update);
    Router.delete("/delete-vendor/{id}", vendorsController.destroy);

    Router.get('/products', productsController.show);
    Router.post('/products', productsController.create);
    Router.put('/update-products/{id}', productsController.update);
    Router.delete('/delete-products/{id}', productsController.destroy);

    Router.get('/productnotes', productNotesController.show);
    Router.post('/productnotes', productNotesController.create);
    Router.put('/update-productnotes/{id}', productNotesController.update);
    Router.delete('/delete-productnotes/{id}', productNotesController.destroy);

    Router.get('/orders', ordersController.show);
    Router.post('/orders', ordersController.create);
    Router.put('/orders/{id}', ordersController.update);
    Router.delete('/orders/{id}', ordersController.destroy);

    Router.get('/orderitems', orderItemsController.show);
    Router.post('/orderitems', orderItemsController.create);
    Router.put('/orderitems/{id}', orderItemsController.update);
    Router.delete('/orderitems/{id}', orderItemsController.destroy);

    //login auth
    Router.group((){
      Router.post('register', authController.register);
      Router.post('login', authController.login);
    }, prefix: 'auth');

    Router.get('me', authController.me).middleware([AuthenticateMiddleware()]);

    Router.group((){
     // Router.patch('update-password', tbLoginController.updatePassword);
      Router.get('', tbLoginController.index);
    }, prefix: 'user', middleware: [AuthenticateMiddleware()]);

    Router.group((){
      Router.post('todo', tbTodoController.store);
    }, prefix: 'todo', middleware: [AuthenticateMiddleware()]);
  }
}
  //   Router.get("/hello-world", () {
  //     return Response.html('Hello World');
  //   }).middleware([HomeMiddleware()]);

  //   // Return error code 400
  //   Router.get('wrong-request',
  //           () => Response.json({'message': 'Hi wrong request'}))
  //       .middleware([ErrorResponseMiddleware()]);

  //   // Return Authenticated user data
  //   Router.get("/user", () {
  //     return Response.json(Auth().user());
  //   }).middleware([AuthenticateMiddleware()]);
  // }
//}