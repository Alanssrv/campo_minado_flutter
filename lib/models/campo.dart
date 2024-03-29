import 'explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({
    required this.linha,
    required this.coluna,
  });

  bool get minado => _minado;
  bool get explodido => _explodido;
  bool get aberto => _aberto;
  bool get marcado => _marcado;

  bool get vizinhancaSegura {
    return vizinhos.every((vizinho) => !vizinho._minado);
  }

  bool get resolvido {
    bool minadoEMarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEMarcado || seguroEAberto;
  }

  int get qtdMinasVizinhanca {
    return vizinhos.where((vizinho) => vizinho.minado).length;
  }

  void addVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }
    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_marcado) return;
    if (_aberto) return;

    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }

    if (vizinhancaSegura) {
      vizinhos.forEach((vizinho) => vizinho.abrir());
    }
  }

  void revelarBomba() {
    if (_minado) _aberto = true;
  }

  void minar() => _minado = true;

  void altenarMarcacao() => _marcado = !_marcado;

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }
}
