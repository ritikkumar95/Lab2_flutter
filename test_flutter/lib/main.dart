import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0.0;
  double myFontSize = 30.0;

  void _incrementCounter() {
    setState(() {

      myFontSize = _counter;
      _counter++;
    });
  }

  void _setNewValue(double newValue){
    setState(() {
      _counter = newValue;
      myFontSize = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          // Column is also a layout widget. It takes a list of children and

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'You have pushed the button this many times:',
                style:TextStyle(fontSize:myFontSize)
            ),
            Text(
                '$_counter',
                style:TextStyle(fontSize:myFontSize)
            ),

            Slider(value: _counter,
                min: 0,
                max: 100,
                divisions: 100,
                label: _counter.round().toString(),
                onChanged: _setNewValue)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}