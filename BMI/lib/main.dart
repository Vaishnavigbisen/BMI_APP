import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'BMI Application', home: MyHomePage(),
    debugShowCheckModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var status = 'Be Healthy';
  var image ='http://codembs.com/workshop/normalWeight.png';
  TextEditingController weight = new TextEditingController();
  TextEditingController height = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Make YourSelf Fit')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            inputField(mycontroller: weight, mytext:'Weight (in KGs)'),
            inputField(mycontroller: height, mytext :'Height (in CMs)'),
            OutlineButton(
              onPressed: (){
                setState(() {
                  var bmiweight = double.parse(weight.text);
                  var bmiheight =double.parse(height.text);

                  var finalBMI= (bmiweight)/(bmiheight/100)*(bmiheight/100);
                  if(finalBMI <18.5)
                    {
                      status = 'Under Weight';
                      image = 'http://codembs.com/workshop/underWeight.png';
                    }
                  else if(finalBMI <24.9)
                    {
                      status = 'Normal Weight';
                      image = 'http://codembs.com/workshop/normalWeight.png';
                    }
                  else if(finalBMI <29.9)
                    {
                      status = 'Over Weight';
                      image ='http://codembs.com/workshop/OverWeight.png';
                    }
                  else
                    {
                      status = 'Obesity';
                      image = 'http://codembs.com/workshop/Obesity.png';
                    }
                });
                
              },
              child: Text('Check Your BMI'),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(image),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('BMI 😊'),
                    Text(status)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class inputField extends StatelessWidget {
  const inputField({
    Key key,
    @required this.mycontroller,@required this.mytext
  }) : super(key: key);

  final TextEditingController mycontroller;
  final String mytext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: mycontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(45.45),
            ),
          ),
            hintText: mytext,
        ),

      ),
    );
  }
}