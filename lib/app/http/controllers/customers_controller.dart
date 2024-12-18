import 'package:vania/vania.dart';
import 'package:vania_project_1/app/models/customers.dart';

class CustomersController extends Controller {

     Future<Response> show(Request request) async {
      try {
        final user = await Customers().query().get();
        return Response.json({
            'message':'Data customer',
            'data'   : user, 
            },201
          );
     }catch (e){
      return Response.json({
          'message': 'Tidak dapat mengambil data, coba lagi nanti' 
        },500
      );
     }
    }

     Future<Response> create(Request request) async {
        try {
        final userData = request.input();
        await Customers().query().insert(userData);
        return Response.json({
            'message':'User berhasil ditambahkan!',
            'data'   : userData, 
            },201
          );
     }catch (e){
      return Response.json({
          'message': 'Server Error, coba lagi nanti' 
        },500
      );
     }
    }

     Future<Response> store(Request request) async {
          return Response.json({});
     }

     Future<Response> edit(int id) async {
          return Response.json({});
     }

     Future<Response> update(Request request,int id) async {
      try {
        final body = await request.input();
        final name = body['cust_name'];
        final address = body['cust_address'];
        final city = body['cust_city'];
        final state = body['cust_state'];
        final zip = body['cust_zip'];
        final country = body['cust_country'];
        final telp = body['cust_telp'];

        final result = await Customers()
        .query()
        .where('cust_id', '=', id)
        .update(
          {
            "cust_name": name,
            "cust_address": address,
            "cust_city": city,
            "cust_state": state,
            "cust_zip": zip,
            "cust_country": country,
            "cust_telp": telp,
          }
        );
        if (result>0){
          return Response.json(
            {
              'mesagge': 'Data berhasil diupdate!',
              'updated_id':id,
            }, 200,
          );
        }else {
          return Response.json(
            {
              'message': 'Data tidak dapat diupdate!',
            }, 404,
          );
        }
      }catch (e){
          return Response.json({
            'message': 'Terjadi kesalahan saat update data!',
            'error': e.toString(),
          },500
        );
     }
    }
     Future<Response> destroy(Request request, int id) async {
      try{
        await Customers().query().where('cust_id','=',id).delete();
        return Response.json({
          'message':'Data user berhasil dihapus!'
        });
     }catch (e){
      return Response.json({
          'message':'Gagal menghapus data!',
          'error': e.toString()
        });
      }
    }
  }

final CustomersController customersController = CustomersController();