import 'package:vania/vania.dart';
import 'package:vania_project_1/app/models/vendors.dart';

class VendorsController extends Controller {

    Future<Response> show(Request request) async {
      try {
        final vendors = await Vendors().query().get();
        return Response.json({
            'message': 'Data vendor',
            'data': vendors, 
          }, 201
        );
      } catch (e) {
        return Response.json({
            'message': 'Tidak dapat mengambil data, coba lagi nanti',
            'error': e.toString()
          }, 500
        );
      }
    }

    Future<Response> create(Request request) async {
      try {
        final vendorData = request.input();
        await Vendors().query().insert(vendorData);
        return Response.json({
            'message': 'Vendor berhasil ditambahkan!',
            'data': vendorData, 
          }, 201
        );
      } catch (e) {
        return Response.json({
            'message': 'Server Error, coba lagi nanti',
            'error': e.toString()
          }, 500
        );
      }
    }

    Future<Response> store(Request request) async {
      return Response.json({});
    }

    Future<Response> edit(int id) async {
      return Response.json({});
    }

    Future<Response> update(Request request, int id) async {
      try {
        final body = await request.input();
        final name = body['vend_name'];
        final address = body['vend_address'];
        final kota = body['vend_kota'];
        final state = body['vend_state'];
        final zip = body['vend_zip'];
        final country = body['vend_country'];

        final result = await Vendors()
          .query()
          .where('vend_id', '=', id)
          .update({
            "vend_name": name,
            "vend_address": address,
            "vend_kota": kota,
            "vend_state": state,
            "vend_zip": zip,
            "vend_country": country,
          });

        if (result > 0) {
          return Response.json({
            'message': 'Data vendor berhasil diupdate!',
            'updated_id': id,
          }, 200);
        } else {
          return Response.json({
            'message': 'Data vendor tidak ditemukan atau tidak dapat diupdate!',
          }, 404);
        }
      } catch (e) {
        return Response.json({
          'message': 'Terjadi kesalahan saat update data!',
          'error': e.toString(),
        }, 500);
      }
    }

    Future<Response> destroy(Request request, int id) async {
      try {
        await Vendors().query().where('vend_id', '=', id).delete();
        return Response.json({
          'message': 'Data vendor berhasil dihapus!'
        });
      } catch (e) {
        return Response.json({
          'message': 'Gagal menghapus data vendor!',
          'error': e.toString()
        });
      }
    }
}

final VendorsController vendorsController = VendorsController();
