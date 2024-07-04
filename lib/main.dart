import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter List View',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter List View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _todoController;
  final List<String> _todoList = [];

  @override
  void initState() {
    super.initState();
    _todoController = TextEditingController();
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _addTodoItem() {
    setState(() {
      if (_todoController.text.isNotEmpty) {
        _todoList.add(_todoController.text);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Please enter a valid todo item"),
            action: SnackBarAction(label: "Ok", onPressed: () {})));
      }
      _todoController.clear();
    });
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  void _showRemoveDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove Todo'),
          content: const Text('Do you want to remove this item?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                _removeTodoItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: _addTodoItem,
                      child: const Text("Add"),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: "Enter a todo item",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _todoList.isEmpty
                  ? const Center(
                child: Text("There are no items in the list"),
              )
                  : ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => _showRemoveDialog(index),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Row number: $index'),
                          Text(_todoList[index]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}