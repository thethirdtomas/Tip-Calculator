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

  var ctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      //Main Container
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          )
        ),
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Text(
                "Tip Calculator",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            Container( 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: TextField(
                controller: ctr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Bill Amount",
                  prefixIcon: Icon(Icons.monetization_on),
                  suffixIcon: GestureDetector(
                    onTap: reset,
                    child: Icon(Icons.clear_all)
                  )
                ),
                onChanged: textChange,
              )
            ),
            Container( 
              margin: EdgeInsets.only(top: 20, bottom: 20),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Tip: \$${tip.toStringAsFixed(2)}", 
                    style: TextStyle(color: getColor(), fontSize: 30) ,
                  ),
                  Slider(
                    activeColor: getColor(),
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
                        activeColor: Colors.red[300],
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
                        activeColor: Colors.greenAccent,
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
      bill = 0.0;
      percentage = 15.0;
      tip = 0.0;
      total = 0.0;
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
      return Colors.red[300];
    else if (percentage >= 20)
      return Colors.greenAccent;
    else
      return Colors.black;
  }
}