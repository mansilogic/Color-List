import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color List Generator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ColorListPage(),
    );
  }
}

class ColorListPage extends StatefulWidget {
  @override
  _ColorListPageState createState() => _ColorListPageState();
}

class _ColorListPageState extends State<ColorListPage> {
  final TextEditingController _textcontroller = TextEditingController();
  List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
  List<Color> selectedColors = [];
   int number = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colors List Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textcontroller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'how many color did you want',
                labelText: 'Insert a number',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                 number = int.tryParse(_textcontroller.text) ?? 0;
               
                setState(() {
                  
                });
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: number,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: colors[index % colors.length],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
