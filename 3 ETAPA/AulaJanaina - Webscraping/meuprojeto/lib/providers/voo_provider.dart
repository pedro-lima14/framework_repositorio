import 'package:flutter/foundation.dart';
import '../services/voo_service.dart';

class VooProvider extends ChangeNotifier {
  final VooService _service = VooService();

  List<dynamic> _voos = [];

  bool _carregando = false;

  String? _erro;

  String _aeroporto = 'SBGR';

  String _tipo = 'chegadas';

  List<dynamic> get voos => _voos;

  bool get carregando => _carregando;

  String? get erro => _erro;

  String get aeroporto => _aeroporto;

  String get tipo => _tipo;

  Future<void> buscarVoos({
    required String aeroporto,
    required String tipo,
  }) async {
    _aeroporto = aeroporto;
    _tipo = tipo;

    _carregando = true;
    _erro = null;

    notifyListeners();

    try {
      final dados = await _service.buscarVoos(
        aeroporto: aeroporto,
        tipo: tipo,
      );

      _voos = dados['voos'] ?? [];
    } catch (e) {
      _voos = [];
      _erro = e.toString().replaceFirst('Exception: ', '');
    }

    _carregando = false;

    notifyListeners();
  }
}