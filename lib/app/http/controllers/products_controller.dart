import 'package:vania/vania.dart';
import 'package:vania_project_1/app/models/products.dart';

class ProductsController extends Controller {
  Future<Response> show(Request request) async {
    try {
      final products = await Products().query().get();
      return Response.json({
        'message': 'Data produk',
        'data': products,
      }, 200);
    } catch (e) {
      return Response.json({
        'message': 'Gagal mengambil data produk!',
      }, 500);
    }
  }

  Future<Response> create(Request request) async {
    try {
      final productData = request.input();
      await Products().query().insert(productData);
      return Response.json({
        'message': 'Produk berhasil ditambahkan!',
        'data': productData,
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
      final prodName = body['prod_name'];
      final prodPrice = body['prod_price'];
      final prodDesc = body['prod_desc'];

      final result = await Products()
          .query()
          .where('prod_id', '=', id)
          .update({
            'prod_name': prodName,
            'prod_price': prodPrice,
            'prod_desc': prodDesc
          });

      if (result > 0) {
        return Response.json({
          'message': 'Produk berhasil diupdate!',
          'updated_id': id,
        }, 200);
      } else {
        return Response.json({
          'message': 'Produk tidak ditemukan!',
        }, 404);
      }
    } catch (e) {
      return Response.json({
        'message': 'Terjadi kesalahan saat update produk!',
        'error': e.toString(),
      }, 500);
    }
  }

  Future<Response> destroy(Request request, int id) async {
    try {
      await Products().query().where('prod_id', '=', id).delete();
      return Response.json({
        'message': 'Produk berhasil dihapus!',
      }, 200);
    } catch (e) {
      return Response.json({
        'message': 'Gagal menghapus produk!',
        'error': e.toString(),
      }, 500);
    }
  }
}

final ProductsController productsController = ProductsController();
