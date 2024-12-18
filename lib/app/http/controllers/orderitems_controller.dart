import 'package:vania/vania.dart';
import 'package:vania_project_1/app/models/orderitems.dart';

class OrderItemsController extends Controller {
  // Menampilkan semua data order items dengan join ke tabel orders dan products
  Future<Response> show(Request request) async {
    try {
      final orderItems = await OrderItems()
          .query()
          .join('orders', 'orderitems.order_num', '=', 'orders.order_num')
          .join('products', 'orderitems.prod_id', '=', 'products.prod_id')
          .get();

      return Response.json({
        'message': 'Data order items beserta orders dan products',
        'data': orderItems,
      }, 200);
    } catch (e) {
      return Response.json({
        'message': 'Gagal mengambil data order items!',
        'error': e.toString(),
      }, 500);
    }
  }

  // Menambahkan order item baru
  Future<Response> create(Request request) async {
    try {
      final orderItemData = request.input(); // Data input dari request
      await OrderItems().query().insert(orderItemData);
      return Response.json({
        'message': 'Order item berhasil ditambahkan!',
        'data': orderItemData,
      }, 201);
    } catch (e) {
      return Response.json({
        'message': 'Gagal menambahkan order item!',
        'error': e.toString(),
      }, 500);
    }
  }

  // Mengupdate order item berdasarkan order_item
  Future<Response> update(Request request, int id) async {
    try {
      final body = await request.input();
      final orderNum = body['order_num'];
      final prodId = body['prod_id'];
      final quantity = body['quantity'];
      final size = body['size'];

      final result = await OrderItems()
          .query()
          .where('order_item', '=', id)
          .update({
            'order_num': orderNum,
            'prod_id': prodId,
            'quantity': quantity,
            'size': size,
          });

      if (result > 0) {
        return Response.json({
          'message': 'Order item berhasil diupdate!',
          'updated_id': id,
        }, 200);
      } else {
        return Response.json({
          'message': 'Order item tidak ditemukan!',
        }, 404);
      }
    } catch (e) {
      return Response.json({
        'message': 'Gagal memperbarui order item!',
        'error': e.toString(),
      }, 500);
    }
  }

  // Menghapus order item berdasarkan order_item
  Future<Response> destroy(Request request, int id) async {
    try {
      final result = await OrderItems()
          .query()
          .where('order_item', '=', id)
          .delete();

      if (result > 0) {
        return Response.json({
          'message': 'Order item berhasil dihapus!',
        }, 200);
      } else {
        return Response.json({
          'message': 'Order item tidak ditemukan!',
        }, 404);
      }
    } catch (e) {
      return Response.json({
        'message': 'Gagal menghapus order item!',
        'error': e.toString(),
      }, 500);
    }
  }
}

final OrderItemsController orderItemsController = OrderItemsController();