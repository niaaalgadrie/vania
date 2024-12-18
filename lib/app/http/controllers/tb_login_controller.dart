import 'package:vania/vania.dart';

class TbLoginController extends Controller {

     Future<Response> index() async {
          Map? user = Auth().user();
          if (user != null){
            user.remove('password');
            return Response.json({
              "status": "success",
              "message": "Data pengguna berhasil diambil",
              "data": user,
            });
          }else{
            return Response.json({
              "status": "error",
              "message": "pengguna tidak terautentikasi"
            }, 401);
          }
     }

     Future<Response> create() async {
          return Response.json({});
     }

     Future<Response> store(Request request) async {
          return Response.json({});
     }

     Future<Response> show(int id) async {
          return Response.json({});
     }

     Future<Response> edit(int id) async {
          return Response.json({});
     }

     Future<Response> update(Request request,int id) async {
          return Response.json({});
     }

     Future<Response> destroy(int id) async {
          return Response.json({});
     }
}

final TbLoginController tbLoginController = TbLoginController();

