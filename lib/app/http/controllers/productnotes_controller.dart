import 'package:vania/vania.dart';
import 'package:vania_project_1/app/models/productnotes.dart';

class ProductNotesController extends Controller {
  // Menampilkan semua data productnotes
  Future<Response> show(Request request) async {
    try {
      final notes = await ProductNotes().query().get();
      return Response.json({
        'message': 'Data semua product notes',
        'data': notes,
      }, 200);
    } catch (e) {
      return Response.json({
        'message': 'Gagal mengambil data product notes!',
        'error': e.toString(),
      }, 500);
    }
  }

  // Menambahkan productnote baru
  Future<Response> create(Request request) async {
    try {
      final noteData = request.input(); // Data input dari request
      await ProductNotes().query().insert(noteData);
      return Response.json({
        'message': 'Product note berhasil ditambahkan!',
        'data': noteData,
      }, 201);
    } catch (e) {
      return Response.json({
        'message': 'Gagal menambahkan product note!',
        'error': e.toString(),
      }, 500);
    }
  }

  // Mengupdate productnote berdasarkan note_id
  Future<Response> update(Request request, int id) async {
    try {
      final body = await request.input();
      final prodId = body['prod_id'];
      final noteDate = body['note_date'];
      final noteText = body['note_text'];

      final result = await ProductNotes()
          .query()
          .where('note_id', '=', id)
          .update({
            'prod_id': prodId,
            'note_date': noteDate,
            'note_text': noteText,
          });

      if (result > 0) {
        return Response.json({
          'message': 'Product note berhasil diupdate!',
          'updated_id': id,
        }, 200);
      } else {
        return Response.json({
          'message': 'Product note tidak ditemukan!',
        }, 404);
      }
    } catch (e) {
      return Response.json({
        'message': 'Gagal memperbarui product note!',
        'error': e.toString(),
      }, 500);
    }
  }

  // Menghapus productnote berdasarkan note_id
  Future<Response> destroy(Request request, int id) async {
    try {
      final result = await ProductNotes()
          .query()
          .where('note_id', '=', id)
          .delete();

      if (result > 0) {
        return Response.json({
          'message': 'Product note berhasil dihapus!',
        }, 200);
      } else {
        return Response.json({
          'message': 'Product note tidak ditemukan!',
        }, 404);
      }
    } catch (e) {
      return Response.json({
        'message': 'Gagal menghapus product note!',
        'error': e.toString(),
      }, 500);
    }
  }
}

final ProductNotesController productNotesController = ProductNotesController();