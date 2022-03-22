import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  void _reiniciar() {
    print('reinicar');
  }

  void _abrir(Campo campo) {
    print('_abrir');
  }

  void _alternarMarcacao(Campo campo) {
    print('_alternarMarcacao');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true,
          reiniciar: _reiniciar,
        ),
        body: Container(
          child: TabuleiroWidget(
            tabuleiro: Tabuleiro(
              linhas: 20,
              colunas: 20,
              qtdBombas: 0,
            ),
            abrir: _abrir,
            altenarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
