import 'dart:html';

import 'package:flutter/material.dart';


class TelaInicial extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TelaInicialState();
  }
}

class TelaInicialState extends State<TelaInicial> {
  String _textoResultado = "";
  var imagem;
  TextEditingController _controllerPeso = new TextEditingController();
  TextEditingController _controllerAltura = new TextEditingController();
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ) ,
      body: Column(
        children: <Widget>[
          criarCampoTexto("Peso: (Kg)", _controllerPeso,),
          criarCampoTexto("Altura: (cm)", _controllerAltura),
          Text(_textoResultado, style: TextStyle(fontSize: 20.0),),
          
          Container(
            height: 50.0, width: 200.00,     
            child: ElevatedButton(           
              onPressed: (){
                var peso = double.tryParse(_controllerPeso.text);
                var altura = double.tryParse(_controllerAltura.text);
                

                if(peso != null && altura != null) {
                  altura = altura / 100;
                  double imc = (peso/(altura * altura));

                  setState(() {
                    //_textoResultado = "Imc $imc";
                    if (imc < 18.5) {
                        _textoResultado =
                            "Seu IMC é: ${imc.toStringAsPrecision(4)}\nAbaixo do Peso";
                        imagem = "assets/images/abaixoDoPeso.jpg";
                      } else if (imc >= 18.5 && imc <= 24.9) {
                        _textoResultado =
                            "Seu IMC é: ${imc.toStringAsPrecision(4)}\nPeso Normal";
                        imagem = "assets/images/pesoNormal.jpg";
                      } else if (imc >= 25.0 && imc <= 29.9) {
                        _textoResultado =
                            "Seu IMC é: ${imc.toStringAsPrecision(4)}\nSobrepeso";
                        imagem = "assets/images/sobrePeso.jpg";
                      } else if (imc >= 30.0 && imc <= 34.9) {
                        _textoResultado =
                            "Seu IMC é: ${imc.toStringAsPrecision(4)}\nObesidade Grau l";
                        imagem = "assets/images/obsidadeGrau01.png";
                      } else if (imc >= 35 && imc <= 39.9) {
                        _textoResultado =
                            "Seu IMC é: ${imc.toStringAsPrecision(4)}\nObesidade Grau ll";
                        imagem = "assets/images/obsidadeGrau02.png";
                      } else if (imc > 39.9) {
                        _textoResultado =
                            "Seu IMC é: ${imc.toStringAsPrecision(4)}\nObesidade Grau lll (Mórbida)";
                        imagem = "assets/images/obsidadeGrau03.png";
                      }
                  });
                  } 
                  else {
                    setState(() {
                      _textoResultado = "Você Precisa Inserir os dados: ";
                    });
                }
              }, child: Text('Calcular', style: TextStyle(fontSize: 20.0)),
            ),
            ),
            Container(
              height: 40,
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: imagem != null ? Image.asset(imagem) : null,
            ),  
        ],
      ),
    );
  }
  
Padding criarCampoTexto(String texto, TextEditingController controllerField) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0), 
          child: TextField(
            controller: controllerField,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: texto,
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
              fontSize: 20.0, color: Colors.blue[800],
            ) 
      ),
    ),
    ); 
  }
}