import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator TCC Widget Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator TCC Widget Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _result = 0.0;
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  void _sum() {

    final firstTxt = firstController.text;
    final secondTxt = secondController.text;
    final firstNumber = double.parse(firstTxt);
    final secondNumber = double.parse(secondTxt);

    setState(() {
      _result = firstNumber + secondNumber;
    });
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_result',
              style: Theme.of(context).textTheme.display1,
            ),
            TextField(
              controller: firstController,
              key: Key('firstInput'),
            ),
            TextField(
              controller: secondController,
              key: Key('secondInput'),
            ),
            RaisedButton(child: Text("SUM"), onPressed: _sum,)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
