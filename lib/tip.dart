import 'package:flutter/material.dart';

class Tip extends StatefulWidget {
  @override
  TipState createState() => new TipState();
}

class TipState extends State<Tip> {
  double tip = 0.0;
  double bill = 0.0;
  double percentage = 15.0;
  double total = 0.0;

  var ctr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Tip Calculator++"),
            ),
      //Main Container
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Container( 
              child: TextField(
                controller: ctr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Bill Amount(\$)",
                  suffixIcon: GestureDetector(
                    onTap: reset,
                    child: Icon(Icons.restore)
                    ),
                  ),
                onChanged: textChange,
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 200),
              child: Text(
                "Tip: \$${tip.toStringAsFixed(2)}", 
                style: TextStyle(color: getColor(), fontSize: 30) ,
                ),
            ),
            Container( 
              child: Column(
                children: <Widget>[
                  Slider(
                    value: percentage,
                    label: "${percentage.toStringAsFixed(0)}%",
                    min: 0,
                    max: 30,
                    divisions: 30,
                    onChanged: updateTip,
                  ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio( 
                        activeColor: Colors.red,
                        value: 10.0,
                        groupValue: percentage,
                        onChanged: updateTip,
                      ),
                      Text('10%'),
                      Radio( 
                        activeColor: Colors.black,
                        value: 15.0,
                        groupValue: percentage,
                        onChanged: updateTip,
                      ),
                      Text('15%'),
                      Radio( 
                        activeColor: Colors.green,
                        value: 20.0,
                        groupValue: percentage,
                        onChanged: updateTip,
                      ),
                      Text('20%'),
                    ],

                  ),
                  Text("Percentage: ${percentage.toStringAsFixed(0)}%"),
                  Text("Total: \$${total.toStringAsFixed(2)}"),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  reset(){
    setState(() {
      ctr.clear();   
      tip = 0.0;
     percentage = 15.0;
     bill = 0.0;
    });
  }

  textChange(String value){
    setState(() {
      try {
        bill = double.parse(value);
      } catch (exception) {
        bill = 0.0;
      }
      tip = bill * (percentage/100);
      total = bill+tip;
    });
  }

   updateTip(double value){
    setState(() {
      percentage = value; 
      tip = bill * (percentage/100);
      total = tip + bill;
    });
  }

  Color getColor(){
    if (percentage <= 10)
      return Colors.red;
    else if (percentage >= 20)
      return Colors.green;
    else
      return Colors.black;
  }
}