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

  void setarValor(String valor) {
    setState(() {
      if (mensagemVisor == '0') {
        mensagemVisor = valor;
      } else {
        mensagemVisor += valor;
      }
    });
  }

  void resetar() {
    setState(() {
      mensagemVisor = '0';
    });
  }

  void realizarCalculo() {
    Parser parser = Parser();
    Expression expressao = parser.parse(mensagemVisor);
    ContextModel contextModel = ContextModel();
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
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyText: 'C',
                            keySize: 25,
                            keyColor: Colors.blue,
                            onPress: () => {resetar()}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyText: 'DEL',
                            keyColor: Colors.blue,
                            onPress: () => {resetar()}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyText: '%',
                            keyColor: Colors.blue,
                            onPress: () => {setarValor('%')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyText: '/',
                            keySize: 25,
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
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyColor: Colors.amber,
                            keyText: '7',
                            onPress: () => {setarValor('7')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyColor: Colors.amber,
                            keyText: '8',
                            onPress: () => {setarValor('8')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyColor: Colors.amber,
                            keyText: '9',
                            onPress: () => {setarValor('9')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyText: '*',
                            keySize: 25,
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
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyColor: Colors.amber,
                            keyText: '4',
                            onPress: () => {setarValor('4')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyColor: Colors.amber,
                            keyText: '5',
                            onPress: () => {setarValor('5')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyColor: Colors.amber,
                            keyText: '6',
                            onPress: () => {setarValor('6')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyText: '+',
                            keySize: 20,
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
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyColor: Colors.amber,
                            keyText: '1',
                            onPress: () => {setarValor('1')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyColor: Colors.amber,
                            keyText: '2',
                            onPress: () => {setarValor('2')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyColor: Colors.amber,
                            keyText: '3',
                            onPress: () => {setarValor('3')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyText: '-',
                            keySize: 25,
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
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyText: '0',
                            keyColor: Colors.amber,
                            onPress: () => {setarValor('0')}),
                        CustomButton(
                            customFlex: 1,
                            keyTextColor: Colors.black,
                            keyText: '.',
                            keySize: 15,
                            keyColor: Colors.amber,
                            onPress: () => {setarValor('.')}),
                        CustomButton(
                            customFlex: 2,
                            keyTextColor: Colors.black,
                            keyText: '=',
                            keySize: 25,
                            keyColor: Colors.blue,
                            onPress: () => realizarCalculo()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
