import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) abrir;
  final void Function(Campo) altenarMarcacao;

  const CampoWidget({
    required this.campo,
    required this.abrir,
    required this.altenarMarcacao,
    Key? key,
  }) : super(key: key);

  Widget _getImage() {
    int qtdMinas = campo.qtdMinasVizinhanca;
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset("assets/images/bomba_0.jpeg");
    } else if (campo.aberto && campo.minado) {
      return Image.asset("assets/images/bomba_1.jpeg");
    } else if (campo.aberto) {
      return Image.asset("assets/images/aberto_$qtdMinas.jpeg");
    } else if (campo.marcado) {
      return Image.asset("assets/images/bandeira.jpeg");
    } else {
      return Image.asset("assets/images/fechado.jpeg");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => abrir(campo),
      onLongPress: () => altenarMarcacao(campo),
      child: _getImage(),
    );
  }
}
