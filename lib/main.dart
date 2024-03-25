import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  void _showSnackBar() {
    if (isSelected1 && isSelected2 && isSelected3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Выбранные параметры: 1, 2, 3'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Проект экзамен'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBlock(
            title: 'Основной цвет',
            isSelected: isSelected1,
            onChanged: (value) {
              setState(() {
                isSelected1 = value;
              });
            },
          ),
          _buildBlock(
            title: 'Показ результата',
            isSelected: isSelected2,
            onChanged: (value) {
              setState(() {
                isSelected2 = value;
              });
            },
          ),
          _buildBlock(
            title: 'Переход между экранами',
            isSelected: isSelected3,
            onChanged: (value) {
              setState(() {
                isSelected3 = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: isSelected1 && isSelected2 && isSelected3
                ? _showSnackBar
                : null,
            child: const Text('Открыть SnackBar'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.search),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
              DrawerHeader(
              child: Text('Критерии'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Критерий 1'),
            ),
            ListTile(
              title: Text('Критерий 2'),
            ),
            ListTile(
              title: Text('Критерий 3'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlock({
    required String title,
    required bool isSelected,
    required ValueChanged<bool> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                onChanged(true);
              },
              child: Container(
                width: 50,
                height: 50,
                color: isSelected ? Colors.green : Colors.grey,
                child: const Center(
                  child: Text(
                    'Выбрано',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                onChanged(false);
              },
              child: Container(
                width: 50,
                height: 50,
                color: isSelected ? Colors.grey : Colors.green,
                child: const Center(
                  child: Text(
                    'Не выбрано',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
