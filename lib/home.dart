import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var result = "";
  Widget btn(var text){
  return Container(
    width: 100,
    height: 70,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black
      ),
      onPressed: (){
      setState(() {
        result = result + text;
      });
    }, child: Text(text, style: TextStyle(fontSize: 30),)),
  );
}

clear(){
  setState(() {
    result ="";
  });
}
output(){
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(result, style: TextStyle(
                    color: Colors.white,
                    fontSize: 100
                  ),),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          primary: Colors.black
                          ),
                          onPressed: clear, child: Text("AC", 
                          style: TextStyle(
                            fontSize: 30,color: Colors.orange))),
                      ),
                      btn("0"),
                      Container(
                        width: 100,
                        height: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          primary: Colors.black
                          ),
                          onPressed: output, child: Text("=", 
                          style: TextStyle(
                            fontSize: 50,color: Colors.orange, fontWeight: FontWeight.bold))),
                      ),
                      btn("/"),
                    ],
                  ),
                  Row(
              children: [
                btn("7"),
                btn("8"),
                btn("9"),
                btn("*"),
              ],
            ),
            Row(
              children: [
                btn("4"),
                btn("5"),
                btn("6"),
                btn("-")
              ],
            ),
            Row(
              children: [
                btn("1"),
                btn("2"),
                btn("3"),
                btn("+")
              ],
            ),
                ],
              ),
            ),
                    ],),
      ),      
    );
  }
}
