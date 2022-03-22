import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) abrir;
  final void Function(Campo) altenarMarcacao;

  const TabuleiroWidget({
    required this.tabuleiro,
    required this.abrir,
    required this.altenarMarcacao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos
            .map((campo) => CampoWidget(
                  campo: campo,
                  abrir: abrir,
                  altenarMarcacao: altenarMarcacao,
                ))
            .toList(),
      ),
    );
  }
}
