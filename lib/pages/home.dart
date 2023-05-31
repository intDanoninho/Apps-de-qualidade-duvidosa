import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
   List<String> opt = ["pedra", "papel", "tesoura"];
   String _msg = "Escolha uma opção!";
   var imageApp = AssetImage("images/default.png");
   void _play(String choice){
    int i = Random().nextInt(opt.length);
    String randomChoice = opt[i];
    this.imageApp = AssetImage("images/$randomChoice.png");
    if((choice=="pedra" && randomChoice == "tesoura") || (choice=="tesoura" && randomChoice == "papel") || (choice=="papel" && randomChoice == "pedra")){
        setState((){
          _msg = "Você venceu!";
        });
    } else if ((choice=="pedra" && randomChoice == "papel") || (choice=="tesoura" && randomChoice == "pedra") || (choice=="papel" && randomChoice == "tesoura")){
        setState((){
          _msg = "Você perdeu :(";
        });
    } else{
        setState((){
          _msg = "Empatamos!";
        });
    }

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 130) ,
        child: Column(
          children:[
            Padding(
              padding: EdgeInsets.only(top:32, bottom: 16),
              child: Text(
                "Escolha do App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Image(image: imageApp, height: 150),
            Padding(
              padding: EdgeInsets.only(top:32, bottom: 16),
              child: Text(
                _msg,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _play("pedra"),
                  child: Image.asset("images/pedra.png", height: 80),
                ),
                GestureDetector(
                  onTap: () => _play("papel"),
                  child: Image.asset("images/papel.png", height: 80),
                ),
                GestureDetector(
                  onTap: () => _play("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 80),
                ),
              ],
            )
            
          ]
        )
      )
    );
  }
}