import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';
  String operacao = '';
  double primeiroNumero = 0.0;
  double resultado = 0.0;

  void reset() {
    setState(() {
      numero = '0';
    });
  }

  void calcular(String tecla) {
    switch (tecla) {
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
      case '0':
        {
          setState(() {
            numero += tecla;
            numero = numero.replaceAll(',', '.');
            if (numero.contains('.')) {
            } else {
              int numeroInt = int.parse(numero);
              numero = numeroInt.toString();
            }
          });
          break;
        }
      case 'AC':
        {
          setState(() {
            numero = '0';
          });
          break;
        }
      case '+':
      case '-':
      case '*':
      case '/':
        {
          operacao = tecla;
          primeiroNumero = double.parse(numero);
          reset();
          break;
        }
      case '=':
        {
          switch (operacao) {
            case '+':
              {
                resultado = primeiroNumero + double.parse(numero);
                break;
              }
            case '-':
              {
                resultado = primeiroNumero - double.parse(numero);
                break;
              }
            case '*':
              {
                resultado = primeiroNumero * double.parse(numero);
                break;
              }
            case '/':
              {
                resultado = primeiroNumero / double.parse(numero);
                break;
              }
          }
            String resultadoString = resultado.toString();

            List<String> resultadoPartes = resultadoString.split('.');

            if (int.parse(resultadoPartes[1]) * 1 == 0) {
              setState(() {
                numero = int.parse(resultadoPartes[0]).toString();
              });
            } else {
              setState(() {
                numero = resultado.toString();
              });
            }

            break;
          }
      case '<x':
        {
          if (numero.isNotEmpty) {
            setState(() {
              numero = numero.substring(0, numero.length - 1);
            });
          }

          if (numero.isEmpty) {
            setState(() {
              numero = '0';
            });
          }
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Calculadora'),
            ),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      numero,
                      style: TextStyle(fontSize: 72),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => calcular('AC'),
                      child: Text(
                        'AC',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Text(''),
                    Text(''),
                    GestureDetector(
                      onTap: () => calcular('<x'),
                      child: Image.asset('assets/images/arrow-back.png',
                          width: 50, height: 50),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => calcular('7'),
                      child: Text(
                        '7',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('8'),
                      child: Text(
                        '8',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('9'),
                      child: Text(
                        '9',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => calcular('/'),
                        child: Image.asset('assets/images/div.png',
                            width: 50, height: 50)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => calcular('4'),
                      child: Text(
                        '4',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('5'),
                      child: Text(
                        '5',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('6'),
                      child: Text(
                        '6',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('*'),
                      child: Image.asset('assets/images/multi.png',
                          width: 50, height: 50),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => calcular('1'),
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('2'),
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('3'),
                      child: Text(
                        '3',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => calcular('-'),
                        child: Image.asset('assets/images/sub.png',
                            width: 50, height: 50)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => calcular('0'),
                      child: Text(
                        '0',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular(','),
                      child: Text(
                        ',',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('='),
                      child: Image.asset('assets/images/igual.png',
                          width: 50, height: 50),
                    ),
                    GestureDetector(
                      onTap: () => calcular('+'),
                      child: Image.asset('assets/images/soma.png',
                          width: 50, height: 50),
                    ),
                  ],
                ),
              ])),
    );
  }
}
