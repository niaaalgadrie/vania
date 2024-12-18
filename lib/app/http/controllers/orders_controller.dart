import 'package:vania/vania.dart';
import 'package:vania_project_1/app/models/orders.dart';

class OrdersController extends Controller {
  Future<Response> show(Request request) async {
    try {
      final orders = await Orders().query().get();
      return Response.json({
        'message': 'Data orders',
        'data': orders,
      }, 200);
    } catch (e) {
      return Response.json({
        'message': 'Gagal mengambil data orders, coba lagi nanti',
      }, 500);
    }
  }

  Future<Response> create(Request request) async {
    try {
      final orderData = request.input();
      await Orders().query().insert(orderData);
      return Response.json({
        'message': 'Order berhasil ditambahkan!',
        'data': orderData,
      }, 201);
    } catch (e) {
      return Response.json({
        'message': 'Server Error, coba lagi nanti',
      }, 500);
    }
  }

  Future<Response> update(Request request, int id) async {
    try {
      final body = await request.input();
      final orderDate = body['order_date'];
      final custId = body['cust_id'];

      final result = await Orders()
          .query()
          .where('order_num', '=', id)
          .update({'order_date': orderDate, 'cust_id': custId});

      if (result > 0) {
        return Response.json({
          'message': 'Order berhasil diupdate!',
          'updated_id': id,
        }, 200);
      } else {
        return Response.json({
          'message': 'Order tidak ditemukan!',
        }, 404);
      }
    } catch (e) {
      return Response.json({
        'message': 'Terjadi kesalahan saat update order!',
        'error': e.toString(),
      }, 500);
    }
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      await Orders().query().where('order_num', '=', id).delete();
      return Response.json({
        'message': 'Order berhasil dihapus!',
      }, 200);
    } catch (e) {
      return Response.json({
        'message': 'Gagal menghapus order!',
        'error': e.toString(),
      }, 500);
    }
  }
}

final OrdersController ordersController = OrdersController();
