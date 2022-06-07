import 'package:calculator/widget/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String mensagemVisor = '0';

  //Método para receber os valores e os operadores e criar a expressão que será repassada para a lib
  void setarValor(String valor) {
    setState(() {
      if (mensagemVisor == '0') {
        mensagemVisor = valor;
      } else {
        mensagemVisor += valor;
      }
    });
  }

  //Limpa o visor da calculadora
  void resetar() {
    setState(() {
      mensagemVisor = '0';
    });
  }

  //Realizar cálculo com equação repassada
  void realizarCalculo() {
    //Se houver divisão trocar o caractere ÷ pelo da barra que é reconhecido pela instrução
    mensagemVisor = mensagemVisor.replaceAll('÷', '/');
    Parser parser = Parser();
    //Nesta linha a expressão matemática será criada de acordo com o que for passado na string
    Expression expressao = parser.parse(mensagemVisor);
    ContextModel contextModel = ContextModel(); //Obtem o contexto da expressão
    //Nesta linha será realisado de fato o cálculo
    double resolucaoDaExpressao =
        expressao.evaluate(EvaluationType.REAL, contextModel);
    setState(() {
      mensagemVisor = resolucaoDaExpressao.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: const Text('Calculadora'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            //Definição do visor da calculadora
            Container(
              alignment: Alignment.bottomRight,
              color: Colors.white,
              margin: const EdgeInsets.all(15),
              width: 400,
              height: 120,
              child: Text(
                mensagemVisor,
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(
                              keyText: 'C',
                              keyColor: Colors.blue,
                              onPress: () => {resetar()}),
                          CustomButton(
                              keyText: 'DEL',
                              keyColor: Colors.blue,
                              onPress: () => {resetar()}),
                          CustomButton(
                              keyText: '%',
                              keyColor: Colors.blue,
                              onPress: () => {setarValor('%')}),
                          CustomButton(
                              keyText: '÷',
                              keyColor: Colors.blue,
                              onPress: () => {setarValor('÷')}),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(
                              keyColor: Colors.amber,
                              keyText: '7',
                              onPress: () => {setarValor('7')}),
                          CustomButton(
                              keyColor: Colors.amber,
                              keyText: '8',
                              onPress: () => {setarValor('8')}),
                          CustomButton(
                              keyColor: Colors.amber,
                              keyText: '9',
                              onPress: () => {setarValor('9')}),
                          CustomButton(
                              keyText: '*',
                              keyColor: Colors.blue,
                              onPress: () => {setarValor('*')}),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(
                              keyColor: Colors.amber,
                              keyText: '4',
                              onPress: () => {setarValor('4')}),
                          CustomButton(
                              keyColor: Colors.amber,
                              keyText: '5',
                              onPress: () => {setarValor('5')}),
                          CustomButton(
                              keyColor: Colors.amber,
                              keyText: '6',
                              onPress: () => {setarValor('6')}),
                          CustomButton(
                              keyText: '+',
                              keyColor: Colors.blue,
                              onPress: () => {setarValor('+')}),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(
                              keyColor: Colors.amber,
                              keyText: '1',
                              onPress: () => {setarValor('1')}),
                          CustomButton(
                              keyColor: Colors.amber,
                              keyText: '2',
                              onPress: () => {setarValor('2')}),
                          CustomButton(
                              keyColor: Colors.amber,
                              keyText: '3',
                              onPress: () => {setarValor('3')}),
                          CustomButton(
                              keyText: '-',
                              keyColor: Colors.blue,
                              onPress: () => {setarValor('-')}),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomButton(
                              keyText: '0',
                              keyColor: Colors.amber,
                              onPress: () => {setarValor('0')}),
                          CustomButton(
                              keyText: '.',
                              keyColor: Colors.amber,
                              onPress: () => {setarValor('.')}),
                          CustomButton(
                              keyText: '=',
                              keyColor: Colors.blue,
                              onPress: () => realizarCalculo()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
